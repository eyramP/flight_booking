# We are building our Docker image on top of the official Python 3.13 slim image.
# A Dockerfile contains instructions Docker follows to build an image.
# A Docker image is a packaged template used to create containers.
# A container is a running (or stopped) instance of a Docker image.
FROM python:3.13-slim-bookworm

ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy
ENV UV_HTTP_TIMEOUT=120

WORKDIR /app

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy everything in our current
#  directory into app directory in the container
COPY . .

# Install dependencies and the project
RUN uv sync --frozen --no-cache

# Start FastAPI using the installed project command
CMD ["/app/.venv/bin/backend"]
