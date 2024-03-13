FROM ubuntu:22.04
RUN useradd -ms /bin/bash buffer 
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    libc6:i386 libncurses5:i386 libstdc++6:i386 xinetd && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/xinetd.d/*
WORKDIR /app
COPY ./app/buffer .
COPY ./app/start.sh /usr/bin/start
COPY ./app/xinetd /etc/xinetd.d/xinetd
COPY ./app/run.sh ./run
RUN chmod +x .
RUN chmod 500 /etc/xinetd.d/xinetd && chmod 500 /usr/bin/start && \
    chmod +x run
EXPOSE 13372
ENTRYPOINT ["/usr/bin/start"]