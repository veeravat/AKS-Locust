FROM locustio/locust
WORKDIR /demo
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

# Start Locust using LOCUS_OPTS environment variable
ENTRYPOINT ["bash", "/demo/run.sh"]