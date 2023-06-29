NAME=${PWD##*/}
NETWORK="${NAME}-network"
IMAGE="${NAME}-image"

set -e

echo "==> building vue ${IMAGE}"
DOCKER_BUILDKIT=1 docker build -t $IMAGE -f Dockerfile .

echo "==> starting tests"

docker run --rm \
    -v "$(pwd)":/home/node/app \
    -w /home/node/app \
    $IMAGE \
    bash -c "npm install && npm run test:unit"
