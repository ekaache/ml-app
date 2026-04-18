FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3=3.12.3-0ubuntu1 \
    python3-pip=24.0+dfsg-1ubuntu1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python3", "app.py"]
