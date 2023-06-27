
NAME=${PWD##*/}

set -e

echo "==> building $NAME image"
DOCKER_BUILDKIT=1 docker build -t "lampimage" .