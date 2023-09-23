FROM rust:latest as build

WORKDIR /helloworld
COPY ./helloworld /helloworld
RUN cargo build --release
#CMD [ "/bin/bash" ]

FROM gcr.io/distroless/cc-debian12:latest
COPY --from=build /helloworld/target/release/helloworld /helloworld
CMD [ "/helloworld" ]