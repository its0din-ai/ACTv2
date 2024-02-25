FROM rust:1.19-stretch
WORKDIR /app
COPY . .
VOLUME /ext-target
RUN cargo build --release
RUN mkdir /ext-target
RUN cp target/release/rustverse-engineer /ext-target/rustverse-engineer