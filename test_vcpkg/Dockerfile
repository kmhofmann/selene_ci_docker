FROM kmhofmann/selene:test_base

RUN git clone https://github.com/Microsoft/vcpkg.git \
 && ./vcpkg/bootstrap-vcpkg.sh \
 && ./vcpkg/vcpkg install libjpeg-turbo libpng opencv boost-filesystem \
 && rm -rf ./vcpkg/buildtrees \
 && rm -rf ./vcpkg/downloads \
 && rm -rf ./vcpkg/packages \
 && git clone https://github.com/Microsoft/vcpkg.git ./vcpkg-libcxx \
 && ./vcpkg-libcxx/bootstrap-vcpkg.sh \
 && CC="clang" CXX="clang++" CPPFLAGS="-stdlib=libc++" \
      ./vcpkg-libcxx/vcpkg install liblzma libjpeg-turbo libpng opencv boost-filesystem \
 && rm -rf ./vcpkg-libcxx/buildtrees \
 && rm -rf ./vcpkg-libcxx/downloads \
 && rm -rf ./vcpkg-libcxx/packages
