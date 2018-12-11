FROM kmhofmann/selene:test_base

# Bootstrap vcpkg and build some libraries.
# Twice, once using GCC/libstdc++, and the other time Clang/libc++.

RUN git clone https://github.com/Microsoft/vcpkg.git \
 && ./vcpkg/bootstrap-vcpkg.sh \
 && ./vcpkg/vcpkg install libjpeg-turbo libpng opencv boost-filesystem \
 && rm -rf ./vcpkg/buildtrees \
 && rm -rf ./vcpkg/downloads \
 && rm -rf ./vcpkg/packages \
 && git clone https://github.com/Microsoft/vcpkg.git ./vcpkg-libcxx \
 && ./vcpkg-libcxx/bootstrap-vcpkg.sh \
 && CC=$(which clang) CXX=$(which clang++) CPPFLAGS="-stdlib=libc++" \
      ./vcpkg-libcxx/vcpkg install libjpeg-turbo libpng opencv boost-filesystem \
 && rm -rf ./vcpkg-libcxx/buildtrees \
 && rm -rf ./vcpkg-libcxx/downloads \
 && rm -rf ./vcpkg-libcxx/packages
