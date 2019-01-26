#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

set -e
set -x

docker build $@ -t kmhofmann/selene_test_base ${SCRIPT_DIR}/test_base/
docker push kmhofmann/selene_test_base
docker build $@ -t kmhofmann/selene_test_apt ${SCRIPT_DIR}/test_apt/
docker push kmhofmann/selene_test_apt
docker build $@ -t kmhofmann/selene_test_vcpkg ${SCRIPT_DIR}/test_vcpkg/
docker push kmhofmann/selene_test_vcpkg
docker build $@ -t kmhofmann/selene_test_vcpkg_android ${SCRIPT_DIR}/test_vcpkg_android/
docker push kmhofmann/selene_test_vcpkg_android
