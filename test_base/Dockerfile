FROM ubuntu:rolling

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  curl \
  unzip \
  tar \
  git \
  cmake \
  ninja-build \
  g++ \
  clang \
  libc++-7-dev \
  libc++abi-7-dev \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/apt/archives/*

RUN mkdir -p /home/selene

WORKDIR /home
