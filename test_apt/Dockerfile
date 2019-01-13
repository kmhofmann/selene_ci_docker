FROM kmhofmann/selene_test_base

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  libjpeg-turbo8-dev \
  libpng-dev \
  libtiff-dev \
  libopencv-dev \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/apt/archives/*
