FROM python:3.10-alpine

# Set working directory
WORKDIR /app

# Install curl, wget, and ca-certificates with pinned versions
RUN apk update && apk add --no-cache \
    curl=7.78.0-r0 \
    wget=1.20.3-r0 \
    ca-certificates && \
    rm -rf /var/cache/apk/*

# Install hadolint
RUN wget -qO- https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64 -O /usr/local/bin/hadolint && \
    chmod +x /usr/local/bin/hadolint

# Copy the requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port your application will run on
EXPOSE 8000

# Command to run your application
CMD ["python", "test.py"]
