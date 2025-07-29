#!/bin/sh


# Set up generic OpenTelemetry environment variables
export OTEL_SERVICE_NAME="${OTEL_SERVICE_NAME:-n8n}"
export OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"
export OTEL_EXPORTER_OTLP_ENDPOINT="${OTEL_EXPORTER_OTLP_ENDPOINT:-http://localhost:4318}"
export OTEL_LOG_LEVEL="info"

# Start n8n with OpenTelemetry instrumentation
echo "Starting n8n with OpenTelemetry instrumentation and OTLP export..."
exec node --require /usr/local/lib/node_modules/n8n/tracing.js /usr/local/bin/n8n "$@"