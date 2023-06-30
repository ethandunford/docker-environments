NAME=${PWD##*/}
IMAGE="${NAME}-image"

echo "==> stopping and removing any old instances"
docker stop $NAME
docker rm $NAME

echo "==> deleting old build"
rm -rf .next

set -e

echo "==> building $IMAGE"
DOCKER_BUILDKIT=1 docker build -t $IMAGE -f Dockerfile .

docker run --rm \
    -v "$(pwd)":/home/node/app \
    -w /home/node/app \
    $IMAGE \
    sh -c "npm install && npm run build"