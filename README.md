KubeCon EU 2019: Intro to CNAB
==============================

# Presentation

A PDF of the presentation can be found in the [presentation](./presentation)
directory.

# Demos

## Requirements

* macOS (if using binaries included with demos)
* Docker Desktop with Docker 19.03.0 or later
* make

## Demo 1

[This demo](./demo1) shows how easy it is to write a CNAB by hand. The demo
simply prints out a message based on the CNAB action.

## Demo 2

[This demo](./demo2) shows the power of CNAB by installing a complex
application. The CNAB installs OpenFaaS to a local Swarm cluster and then a
simple Python echo lambda.

## Disclaimer

These demos are for illustrative purposes only. They are far from production
ready.

The demos were inspired by the
[CNAB example bundles](https://github.com/deislabs/example-bundles).
