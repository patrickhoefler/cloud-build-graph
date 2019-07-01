# cloudbuildgraph

[![Go Report Card](https://goreportcard.com/badge/github.com/patrickhoefler/cloudbuildgraph)](https://goreportcard.com/report/github.com/patrickhoefler/cloudbuildgraph)

Visualize your Google Cloud Build steps with GraphViz.

## Getting Started

### Prerequisites

Make sure you have [GraphViz](https://www.graphviz.org/) installed.

## Usage

```shell
docker run --rm -v "$(pwd)"/cloudbuild.yaml:/cloudbuild.yaml patrickhoefler/cloudbuildgraph | dot -Tpdf > cloudbuild.pdf
```

## Known Issues

- `cloudbuildgraph` currently expects a `cloudbuild.yaml` file in the working directory.
- `cloudbuildgraph` currently expects that every build step has an ID.
