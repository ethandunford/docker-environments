set -e

NAME=${PWD##*/}
NETWORK="${NAME}-nextwork"
IMAGE="${NAME}-image"

echo "==> stopping and removing any old instances"
docker stop $NAME
docker rm $NAME

echo "==> creating ${NETWORK}"
docker network create -d bridge ${NETWORK} || true

echo "==> building ${NAME} image"
DOCKER_BUILDKIT=1 docker build -t $IMAGE -f Dockerfile .

docker run \
    --name=$NAME \
    -v "$(pwd)/app":/root \
    --network=$NETWORK \
    -e DB="dbname='pythondb' user='pythondb' password='password' host='db'" \
    -it $IMAGE /bin/bash