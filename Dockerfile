FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -yy \
  asciidoctor \
  autoconf \
  automake \
  ccache \
  clang \
  gcc \
  graphviz \
  kmod \
  libssl-dev \
  libtool \
  git \
  iproute2 \
  repo
