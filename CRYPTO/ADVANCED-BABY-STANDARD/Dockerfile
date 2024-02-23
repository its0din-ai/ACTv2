FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirror.poliwangi.ac.id\/ubuntu\//g' /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y \
    python3 python3-pip bat \
    xinetd && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/xinetd.d/*

WORKDIR /app
COPY ./app/crypt.py ./app/secret.py ./app/requirements.txt .
COPY ./app/start.sh /usr/bin/start
COPY ./app/xinetd /etc/xinetd.d/xinetd
COPY ./app/run.sh ./run

RUN pip3 install -r requirements.txt
RUN chmod +x .
RUN chmod 500 /etc/xinetd.d/xinetd && chmod 500 /usr/bin/start && \
    chmod +x run

EXPOSE 13371
ENTRYPOINT ["/usr/bin/start"]