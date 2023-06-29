NAME=${PWD##*/}
NETWORK="${NAME}-network"
IMAGE="${NAME}-image"

echo "==> stopping and removing any old instances"
docker stop $NAME
docker rm $NAME

set -e

echo "==> creating ${NETWORK}"
docker network create -d bridge $NETWORK || true

echo "==> building $IMAGE"
DOCKER_BUILDKIT=1 docker build -t $IMAGE -f Dockerfile .

docker run --rm \
    -it \
    -v "$(pwd)/":/home/node/app \
    -w /home/node/app \
    --name=$NAME \
    -p 5173:5173 \
    $IMAGE \
    bash