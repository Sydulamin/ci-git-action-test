FROM python:3.10-slim as base

WORKDIR /app

RUN wget https://curl.se/download/curl-7.68.0.tar.gz && \
    tar -xvzf curl-7.68.0.tar.gz && \
    cd curl-7.68.0 && \
    ./configure && make && make install && \
    wget https://ftp.gnu.org/gnu/wget/wget-1.20.3.tar.gz && \
    tar -xvzf wget-1.20.3.tar.gz && \
    cd wget-1.20.3 && \
    ./configure && make && make install

RUN wget --progress=dot:giga https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64 -O /usr/local/bin/hadolint && \
    chmod +x /usr/local/bin/hadolint

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "test.py"]
