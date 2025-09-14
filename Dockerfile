# QVeritas Production Dockerfile
# Multi-stage build for optimal security and performance

# Build stage
FROM python:3.11-slim as builder

LABEL maintainer="Vaibhav Kumar <vaibhavkumarchhimpa@gmail.com>"
LABEL description="QVeritas: Quantum-Deterministic Proof Platform"
LABEL version="1.0.0"

# Security: Create non-root user
RUN groupadd -r qveritas && useradd -r -g qveritas qveritas

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Production stage
FROM python:3.11-slim as production

# Install runtime dependencies only
RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Create non-root user
RUN groupadd -r qveritas && useradd -r -g qveritas qveritas

# Set working directory
WORKDIR /app

# Copy Python packages from builder
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy application code
COPY src/ ./src/
COPY tests/ ./tests/
COPY README.md LICENSE ./

# Set proper permissions
RUN chown -R qveritas:qveritas /app

# Switch to non-root user
USER qveritas

# Environment variables
ENV PYTHONPATH=/app/src
ENV PYTHONUNBUFFERED=1
ENV QVERITAS_LOG_LEVEL=INFO

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import src.quantum_veritas; print('QVeritas healthy')" || exit 1

# Expose port for API (if implemented)
EXPOSE 8080

# Default command
CMD ["python", "src/quantum_veritas.py"]

# Security labels
LABEL security.scan.enabled="true"
LABEL security.non-root="true"
LABEL security.privileged="false"