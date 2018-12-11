FROM kmhofmann/selene:test_base

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  libjpeg-turbo8-dev \
  libpng-dev \
  libopencv-dev \
  libboost-filesystem-dev \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/apt/archives/*
