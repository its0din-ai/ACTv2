FROM ubuntu:22.04
RUN useradd -ms /bin/bash actpyc 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    python3.11 \
    xinetd && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/xinetd.d/*
WORKDIR /app
COPY ./app/make_password.pyc .
COPY ./app/start.sh /usr/bin/start
COPY ./app/xinetd /etc/xinetd.d/xinetd
COPY ./app/run.sh ./run
RUN chmod +x .
RUN chmod 500 /etc/xinetd.d/xinetd && chmod 500 /usr/bin/start && \
    chmod +x run
EXPOSE 13373
ENTRYPOINT ["/usr/bin/start"]