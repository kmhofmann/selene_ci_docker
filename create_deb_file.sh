#!/usr/bin/env bash

set -e
set -x

D_USER="kmhofmann"
D_IMG="package_deb_ubuntu-18.04"
D_IMG_TEST="package_deb_test"

# Create DEB file.
docker build --no-cache -t $D_USER/$D_IMG ./$D_IMG

# Get DEB file copied out.
export ID=$(docker run --detach -t $D_USER/$D_IMG /bin/bash)
export DEB=$(docker exec $ID bash -c 'ls /home/selene/build/selene*.deb')
docker cp $ID:$DEB .
docker stop $ID

# And copy it to the test directory.
rm -f ./$D_IMG_TEST/*.deb
cp $(find . -name "*deb") ./$D_IMG_TEST

# Test installation of DEB file in small sample project.
docker build --no-cache -t $D_USER/$D_IMG_TEST ./$D_IMG_TEST

# Clean up, and rename DEB file.
rm ./$D_IMG_TEST/*.deb
OLDNAME=$(ls ./selene*.deb)
NEWNAME=$(echo $OLDNAME | sed -e 's/Linux/ubuntu-18.04/g' -)
mv $OLDNAME $NEWNAME
