# Use an official Python runtime as a parent image
FROM python:3.11-slim

RUN useradd --create-home appuser

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
USER appuser

COPY --chown=appuser:appuser requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=appuser:appuser . .

EXPOSE 5000

CMD ["python", "app.py"]