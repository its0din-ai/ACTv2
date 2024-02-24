FROM oven/bun:1 as base
RUN mkdir /tmp/log/ && chmod 777 /tmp/log/ && touch /tmp/log/running.log && chmod 777 /tmp/log/running.log
WORKDIR /app/
COPY ./src/* .
RUN bun install --frozen-lockfile --production
CMD ["bun", "start"]