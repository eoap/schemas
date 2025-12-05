import os
import json
import streamlit as st
from code_editor import code_editor
import tempfile
from io import StringIO
from cwltool.main import main as cwltool
import yaml
from loguru import logger
import folium
from streamlit_folium import st_folium

st.header("STAC API with CWL Playground")
st.set_page_config(layout="wide")

def run_cwl(job):
    """Runs a CWL job.

    Returns
    -------
    tuple
        A tuple containing the return value of cwltool and
        the stdout and stderr content
    """
    temp_dir = tempfile.mkdtemp()
    temp_job_path = os.path.join(temp_dir, "temp_job.yaml")

    with open(temp_job_path, "w") as outfile:
        yaml.dump(job, outfile, default_flow_style=False)

    out = StringIO()
    err = StringIO()
    res = cwltool(
        ["https://github.com/eoap/schemas/releases/download/0.1.0/stac-api-client.0.1.0.cwl", temp_job_path],
        stderr=err,
        stdout=out,
    )
    os.remove(temp_job_path)

    return res, out.getvalue(), err.getvalue()


btn_settings_editor_btns = [
    {
        "name": "copy",
        "feather": "Copy",
        "hasText": True,
        "alwaysOn": True,
        "commands": ["copyAll"],
        "style": {"top": "0rem", "right": "0.4rem"},
    },
    {
        "name": "update",
        "feather": "RefreshCw",
        "primary": True,
        "hasText": True,
        "showWithIcon": True,
        "commands": ["submit"],
        "style": {"bottom": "0rem", "right": "0.4rem"},
    },
]

with open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "resources/custom_buttons_bar_alt.json")) as json_button_file_alt:
    custom_buttons_alt = json.load(json_button_file_alt)

height = [22, 25]
language = "yaml"
theme = "default"
shortcuts = "vscode"
focus = False
wrap = True
btns = custom_buttons_alt

example_job = """\
api_endpoint:
  url:
    value: https://planetarycomputer.microsoft.com/api/stac/v1
  headers: []

search_request:
  collections: 
  - landsat-c2-l2
  datetime_interval:
    start:
      value: "2023-10-15T18:00:00"
    end:
      value: "2023-10-15T18:59:59"
  bbox: 
  - -118.985
  - 38.432
  - -118.183
  - 38.938
  filter-lang: cql2-json
  filter:
      {
        "op": "and",
        "args":
          [
            { "op": "<=", "args": [{ "property": "eo:cloud_cover" }, 60] },
            { "op": ">=", "args": [{ "property": "eo:cloud_cover" }, 0] },
          ],
      }
"""

ace_props = {"style": {"borderRadius": "0px 0px 8px 8px"}}
response_dict = code_editor(
    example_job,
    height=height,
    lang=language,
    theme=theme,
    shortcuts=shortcuts,
    focus=focus,
    buttons=btns,
    props=ace_props,
    options={"wrap": wrap},
    allow_reset=True,
    key="code_editor_demo",
)

if response_dict["type"] == "submit":
    job_content = response_dict["text"]

    try:
        res, out, err = run_cwl(yaml.load(job_content, Loader=yaml.FullLoader))

        feature_collection = {}

        if res != 0:
            st.error(f"Execution failed with error code {res}.")
            st.text_area("Execution Output", value=out, height=10)
            st.text_area("Execution Error", value=err, height=300)
            st.stop()
        else:

            st.text_area("Execution log", value=err, height=10)
            st.text_area("Execution results", value=out, height=300)
            output = json.loads(out)
            logger.info(f"Output: {output}")
            with open(output.get("search_output", {}).get("location", "").replace("file://", ""), "r") as f:
                feature_collection = yaml.safe_load(f)

            m = folium.Map(tiles="cartodbpositron", control_scale=True)

            # --- Add GeoJSON layer ---
            gj = folium.GeoJson(
                feature_collection,
                name="Features",
                tooltip=folium.GeoJsonTooltip(fields=["description"], aliases=["Name"], sticky=False),
                popup=folium.GeoJsonPopup(fields=["description"], aliases=["Name"]),
                zoom_on_click=False,  # keep the global fit
            )
            gj.add_to(m)

            # --- Fit map to FeatureCollection bounds ---
            try:
                bounds = gj.get_bounds()  # [[south, west], [north, east]]
                if bounds and bounds != [[None, None], [None, None]]:
                    m.fit_bounds(bounds, padding=(20, 20))
                else:
                    # fallback if bounds can’t be computed
                    m.location = [0, 0]
                    m.zoom_start = 2
            except Exception:
                # very defensive fallback
                m.location = [0, 0]
                m.zoom_start = 2
        


        # Optional: layer control if you add more layers
        folium.LayerControl(collapsed=False).add_to(m)

        # --- Render in Streamlit ---
        st.title("FeatureCollection Map")
        st.caption("The map automatically fits to the bounds of your GeoJSON.")
        st_folium(m, width=None, height=600)

        if st.checkbox("Show feature collection JSON"):
            st.subheader("FeatureCollection")
            st.json(feature_collection)

    except Exception as e:
        st.error(f"Error parsing CWL: {e}")