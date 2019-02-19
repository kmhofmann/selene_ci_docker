FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  wget tar git ninja-build g++ \
  libjpeg-turbo8-dev libpng-dev libtiff-dev libopencv-dev

WORKDIR /home

RUN wget https://github.com/Kitware/CMake/releases/download/v3.13.4/cmake-3.13.4-Linux-x86_64.tar.gz
RUN tar xf cmake-3.13.4-Linux-x86_64.tar.gz
ENV PATH /home/cmake-3.13.4-Linux-x86_64/bin:$PATH

RUN git clone https://github.com/kmhofmann/selene.git
RUN mkdir -p selene/build

RUN cd selene/build && cmake -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
      -DCPACK_DEBIAN_PACKAGE_ARCHITECTURE=$(dpkg --print-architecture) \
      -DCPACK_DEBIAN_PACKAGE_DEPENDS="libstdc++6, libjpeg-turbo8, libpng16-16, libtiff5" \
      ..
RUN cd selene/build && cmake --build .
RUN cd selene/build && cpack -G "DEB" -C Release --verbose
RUN dpkg-deb --info selene/build/selene*.deb

## To determine the package names above, list all dependencies...
#RUN for file in ./selene/build/selene/*.so; do echo $file; ldd $file; done
## ...and query which package they belong to:
#RUN dpkg-query -S libstdc++.so.6
#RUN dpkg-query -S libjpeg.so.8
#RUN dpkg-query -S libpng16.so.16
#RUN dpkg-query -S libtiff.so.5
