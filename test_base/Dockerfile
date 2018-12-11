FROM ubuntu:rolling

WORKDIR /home

# Unfortunately, the untarred Clang folder is huge. Just to use libc++...

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  curl \
  wget \
  unzip \
  tar \
  xz-utils \
  git \
  cmake \
  ninja-build \
  g++ \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/apt/archives/* \
 && wget http://releases.llvm.org/7.0.0/clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz \
 && export CLANG_NAME=clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-16.04 \
 && tar xf ${CLANG_NAME}.tar.xz \
 && mv ${CLANG_NAME}/bin/* /usr/local/bin/ \
 && mv ${CLANG_NAME}/include/* /usr/local/include \
 && mv ${CLANG_NAME}/lib/* /usr/local/lib \
 && mv ${CLANG_NAME}/libexec /usr/local \
 && rm ${CLANG_NAME}.tar.xz \
 && rm -rf ${CLANG_NAME} \
 && mkdir -p /home/selene

