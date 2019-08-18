FROM kmhofmann/selene_test_base

# Build and install vcpkg using GCC/libstdc++
RUN git clone https://github.com/Microsoft/vcpkg.git \
 && ./vcpkg/bootstrap-vcpkg.sh \
 && ./vcpkg/vcpkg install libjpeg-turbo libpng opencv \
 && rm -rf ./vcpkg/buildtrees \
 && rm -rf ./vcpkg/downloads \
 && rm -rf ./vcpkg/packages \
# Build and install vcpkg using Clang/libc++
 && git clone https://github.com/Microsoft/vcpkg.git ./vcpkg-libcxx \
 && CC=gcc CXX=g++ ./vcpkg-libcxx/bootstrap-vcpkg.sh \
 && CC=clang CXX=clang++ CXXFLAGS="-stdlib=libc++" LDFLAGS="-stdlib=libc++" \
      ./vcpkg-libcxx/vcpkg install libjpeg-turbo libpng tiff opencv \
 && rm -rf ./vcpkg-libcxx/buildtrees \
 && rm -rf ./vcpkg-libcxx/downloads \
 && rm -rf ./vcpkg-libcxx/packages
