FROM ubuntu:latest@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241

LABEL org.opencontainers.image.source="https://github.com/patrickhoefler/cloudbuildgraph"

# Because there is no "lock" mechanism for apt dependencies,
# this step prevents a fully reproducible build
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  graphviz \
  && rm -rf /var/lib/apt/lists/*

# Run as non-root user
RUN groupadd --gid 1000 cloudbuildgraph \
  && useradd --uid 1000 --gid cloudbuildgraph --shell /bin/bash --create-home cloudbuildgraph
USER cloudbuildgraph

# This currently only works with goreleaser
# or if you manually copy the binary into the main project directory
COPY cloudbuildgraph /

WORKDIR /cloudbuild

ENTRYPOINT ["/cloudbuildgraph"]
