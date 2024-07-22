# Base stage for both development and production
FROM python:3.9 AS base
WORKDIR /app
COPY requirements.txt requirements-dev.txt ./
COPY app/ app/

# Install common dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Development stage
FROM base AS dev
EXPOSE 5000 5678
RUN pip install --no-cache-dir -r requirements-dev.txt
ENTRYPOINT ["tail", "-f", "/dev/null"] # Keep the container running for development

# Production stage
FROM base AS prod
EXPOSE 5000
CMD ["python", "app/app.py"]
