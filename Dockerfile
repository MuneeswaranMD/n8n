FROM n8nio/n8n:latest

USER root

# Install curl for healthcheck
RUN apk add --no-cache curl

USER node

# Expose n8n port
EXPOSE 5678

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

CMD ["n8n", "start"]
