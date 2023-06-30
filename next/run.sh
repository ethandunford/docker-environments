NAME=${PWD##*/}
NETWORK="${NAME}-network"
IMAGE="${NAME}-image"

echo "==> stopping and removing any old instances"
docker stop $NAME
docker rm $NAME

set -e

echo "==> building $IMAGE"
DOCKER_BUILDKIT=1 docker build -t $IMAGE -f Dockerfile .

docker run --rm \
    -it \
    --name $NAME \
    -v "$(pwd)/":/home/node/app \
    -w /home/node/app \
    -p 3000:3000 \
    $IMAGE \
    bash