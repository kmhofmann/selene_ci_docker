FROM ubuntu:19.10

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  wget \
  curl \
  unzip \
  tar \
  git \
  cmake \
  ninja-build \
  g++ \
  clang \
  libc++-dev \
  libc++abi-dev \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/apt/archives/*

RUN mkdir -p /home/selene

WORKDIR /home
