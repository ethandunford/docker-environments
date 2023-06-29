
NAME=${PWD##*/}

echo "==> stopping and removing any old instances"
docker stop $NAME
docker rm $NAME

echo "==> creating vue-network"
docker network create -d bridge vue-network || true

echo "==> building vue image"

DOCKER_BUILDKIT=1 docker build -t $NAME -f Dockerfile.

docker run --rm \
    -it \
    -v "$(pwd)/":/home/node/app \
    -w /home/node/app \
    --name=$NAME \
    -p 5173:5173 \
    $NAME \
    bash