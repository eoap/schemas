# Your first custom-type input

In this tutorial, you will run a CWL tool that accepts a GeoJSON Point and prints its coordinates. You will see how a schema, an input document, and a tool fit together.

## Prepare your environment

You need Git, Python 3 with virtual environment support, Node.js for CWL JavaScript expressions, and internet access to resolve the imported schema. Run these commands in a terminal:

```bash
git clone https://github.com/eoap/schemas.git
cd schemas
python3 -m venv .venv
. .venv/bin/activate
python -m pip install cwltool
```

If you already have a checkout, start from its root directory. Keep that directory as your working directory for the remaining steps.

## Inspect the input

Open `examples/geojson/point.yaml`. It contains a `point_of_interest` with the GeoJSON type `Point`, coordinates `[125.6, 10.1]`, and a bounding box.

Open `examples/geojson/point.cwl`. Its `SchemaDefRequirement` imports `geojson.yaml`, and its `point_of_interest` input selects the `Point` type from that schema. The input binding reads the coordinates and formats them for `echo`.

## Run the tool

```bash
cwltool examples/geojson/point.cwl examples/geojson/point.yaml
```

The runner logs its progress and prints a JSON output object containing `echo_output`, a reference to the file created by the tool.

Read that file:

```bash
cat echo_output.txt
```

You should see:

```text
Point Coordinates: 125.6, 10.1
```

You have passed a structured record to a CWL tool and used its fields in a command.

## Continue learning

Follow the [GeoJSON Feature example](../geojson/feature.ipynb) to try a richer input. To apply the same import pattern to your own tool, see [use an existing schema](../how-to/use-schema.md). The [GeoJSON reference](../geojson/index.md) lists the available types.
