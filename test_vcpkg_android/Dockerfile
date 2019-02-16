FROM kmhofmann/selene_test_base

# Download Android NDK
RUN wget https://dl.google.com/android/repository/android-ndk-r19-linux-x86_64.zip \
 && unzip -q android-ndk-r19-linux-x86_64.zip \
 && rm android-ndk-r19-linux-x86_64.zip \
 && export ANDROID_NDK_HOME=/home/android-ndk-r19 \
# Clean up a bit
 && rm -rf ./android-ndk-r19/wrap.sh \
 && rm -rf ./android-ndk-r19/shader-tools \
 && rm -rf ./android-ndk-r19/prebuilt \
 && rm -rf ./android-ndk-r19/simpleperf \
 && rm -rf ./android-ndk-r19/python-packages \
 && rm -rf ./android-ndk-r19/toolchains/renderscript \
 && rm -rf ./android-ndk-r19/toolchains/aarch64-linux-android-4.9 \
 && rm -rf ./android-ndk-r19/toolchains/x86_64-4.9 \
 && rm -rf ./android-ndk-r19/toolchains/arm-linux-androideabi-4.9 \
 && rm -rf ./android-ndk-r19/toolchains/x86-4.9 \
# Clone and bootstrap vcpkg 
 && git clone https://github.com/Microsoft/vcpkg.git \
 && ./vcpkg/bootstrap-vcpkg.sh \
# Add custom triplet for Android (arm64)
 && echo "set(VCPKG_TARGET_ARCHITECTURE arm64)" > ./vcpkg/triplets/arm64-android.cmake \
 && echo "set(VCPKG_CRT_LINKAGE dynamic)" >> ./vcpkg/triplets/arm64-android.cmake \
 && echo "set(VCPKG_LIBRARY_LINKAGE static)" >> ./vcpkg/triplets/arm64-android.cmake \
 && echo "set(VCPKG_CMAKE_SYSTEM_NAME Android)" >> ./vcpkg/triplets/arm64-android.cmake \
# Install all libraries except libpng
 && ./vcpkg/vcpkg install libjpeg-turbo tiff --triplet arm64-android \
# Install libpng:
# The first attempt to install libpng doesn't find libm, so we just don't let it find it...
 && ./vcpkg/vcpkg install libpng --triplet arm64-android || true \
 && sed -i "s/find_library(M_LIBRARY m)/set(M_LIBRARY \"\")/g" $(find ./vcpkg/buildtrees/libpng/ -name "CMakeLists.txt") \
 && ./vcpkg/vcpkg install libpng --triplet arm64-android \
# Clean up vcpkg
 && rm -rf ./vcpkg/buildtrees \
 && rm -rf ./vcpkg/downloads \
 && rm -rf ./vcpkg/packages \
# Download Boost
 && wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.bz2 \
 && tar xf boost_1_69_0.tar.bz2 \
 && rm boost_1_69_0.tar.bz2
