FROM python:3.10-slim as base

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*
    
RUN wget -qO- https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64 -O /usr/local/bin/hadolint && \
    chmod +x /usr/local/bin/hadolint

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "test.py"]
