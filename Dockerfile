FROM n8nio/n8n:latest

USER root

# Install curl for healthcheck (Debian-based image)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

USER node

# Expose n8n port
EXPOSE 5678

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

CMD ["n8n", "start"]
