FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  wget git cmake ninja-build g++ \
  libjpeg-turbo8-dev libpng-dev libtiff-dev

WORKDIR /home

RUN wget https://github.com/Kitware/CMake/releases/download/v3.13.4/cmake-3.13.4-Linux-x86_64.tar.gz
RUN tar xf cmake-3.13.4-Linux-x86_64.tar.gz
ENV PATH /home/cmake-3.13.4-Linux-x86_64/bin:$PATH

COPY selene*.deb /home
RUN dpkg -i selene*.deb

RUN git clone https://github.com/kmhofmann/selene_as_dependency_test.git
RUN mkdir -p selene_as_dependency_test/build

RUN cd selene_as_dependency_test/build && cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..
RUN cd selene_as_dependency_test/build && cmake --build . -j
RUN cd selene_as_dependency_test/build && ./selene_as_dependency_test
