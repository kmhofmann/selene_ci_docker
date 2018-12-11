FROM kmhofmann/selene:test_base

# NOTE: remove the checkout of a particular has again when vcpkg has fixed its
# bootstrapping breakage (https://github.com/Microsoft/vcpkg/pull/4946).

RUN git clone https://github.com/Microsoft/vcpkg.git \
 && git -C ./vcpkg checkout 5ff5ab7ae29313e95eab07172721800c5fa84c0c \
 && ./vcpkg/bootstrap-vcpkg.sh \
 && ./vcpkg/vcpkg install libjpeg-turbo libpng opencv boost-filesystem \
 && rm -rf ./vcpkg/buildtrees \
 && rm -rf ./vcpkg/downloads \
 && rm -rf ./vcpkg/packages \
 && git clone https://github.com/Microsoft/vcpkg.git ./vcpkg-libcxx \
 && git -C ./vcpkg-libcxx checkout 5ff5ab7ae29313e95eab07172721800c5fa84c0c \
 && ./vcpkg-libcxx/bootstrap-vcpkg.sh \
 && CC="clang" CXX="clang++" CPPFLAGS="-stdlib=libc++" \
      ./vcpkg-libcxx/vcpkg install liblzma libjpeg-turbo libpng opencv boost-filesystem \
 && rm -rf ./vcpkg-libcxx/buildtrees \
 && rm -rf ./vcpkg-libcxx/downloads \
 && rm -rf ./vcpkg-libcxx/packages
