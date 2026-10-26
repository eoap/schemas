# Use an official Python base image
FROM docker.io/library/python:3.11.17-slim-bookworm@sha256:f06d01d4ba3f8ad5af45a3ec87df19c1d317d8e8961edc0fabda61811af6f7cf

# Refresh the OS trust store before downloading Python packages.
RUN apt-get update && apt-get install -y --only-upgrade ca-certificates && \
    update-ca-certificates && rm -rf /var/lib/apt/lists/*

# Set environment variables to reduce image size
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Set up a default user and home directory
ENV HOME=/home/neo

# Create a user with UID 1001, group root, and a home directory
RUN groupadd -g 2000 neo && \
    useradd -u 2000 -r -g 2000 -m -d ${HOME} -s /sbin/nologin \
      -c "Default Neo User" neo && \
    mkdir -p /app && \
    mkdir -p ${HOME}/.cache && \
    chown -R 2000:2000 /app ${HOME} && \
    chmod g+rwx ${HOME} /app

# Switch to the non-root user
USER neo


# Copy the application files into the /code directory
COPY --chown=2000:2000 . /app

# Set working directory
WORKDIR /app


# Install Python dependencies
RUN pip install --no-cache-dir --upgrade "pip @ https://files.pythonhosted.org/packages/3f/06/3e4420302363fbb71be3c7f35ce042f54bfca330e3e66b3a2e3c4cca579f/pip-26.2.2-py3-none-any.whl#sha256=fd7f4dfa8190e014013b9f08f3e973f4e4c26ffd179a204895533a7254813a70" && \
    pip install --no-cache-dir --upgrade "certifi>=2026.10.19" && \
    pip install --upgrade pip && \
    pip install -e . && \
    pip install streamlit streamlit_code_editor cwltool pyyaml streamlit-folium folium pystac-client
# Copy app code
COPY --chown=2000:2000 . .

# Expose Streamlit default port
EXPOSE 8501

ENV PATH="/home/neo/.local/bin:${PATH}"

# Run Streamlit app
CMD ["streamlit", "run", "playground/playground.py", "--server.port=8501", "--server.address=0.0.0.0"]
