FROM kmhofmann/selene_test_base

RUN wget -q https://dl.google.com/android/repository/android-ndk-r19-linux-x86_64.zip \
 && unzip -q android-ndk-r19-linux-x86_64.zip \
 && rm android-ndk-r19-linux-x86_64.zip \
 && export ANDROID_NDK_HOME=/home/android-ndk-r19 \
 && git clone https://github.com/Microsoft/vcpkg.git \
 && ./vcpkg/bootstrap-vcpkg.sh \
 && echo "set(VCPKG_TARGET_ARCHITECTURE arm64)" > ./vcpkg/triplets/arm64-android.cmake \
 && echo "set(VCPKG_CRT_LINKAGE dynamic)" >> ./vcpkg/triplets/arm64-android.cmake \
 && echo "set(VCPKG_LIBRARY_LINKAGE static)" >> ./vcpkg/triplets/arm64-android.cmake \
 && echo "set(VCPKG_CMAKE_SYSTEM_NAME Android)" >> ./vcpkg/triplets/arm64-android.cmake \
 && ./vcpkg/vcpkg install libjpeg-turbo tiff --triplet arm64-android \
# The first attempt to install libpng doesn't find libm, so we just don't let it find it...
 && ./vcpkg/vcpkg install libpng --triplet arm64-android || true \
 && sed -i "s/find_library(M_LIBRARY m)/set(M_LIBRARY \"\")/g" $(find ./vcpkg/buildtrees/libpng/ -name "CMakeLists.txt") \
 && ./vcpkg/vcpkg install libpng --triplet arm64-android \
 && rm -rf ./vcpkg/buildtrees \
 && rm -rf ./vcpkg/downloads \
 && rm -rf ./vcpkg/packages \
