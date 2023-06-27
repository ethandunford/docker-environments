NAME=${PWD##*/}

echo "==> building vue image"

DOCKER_BUILDKIT=1 docker build -t $NAME -f Dockerfile .

echo "building $NAME"

docker run --rm \
    -v "$(pwd)":/home/node/app \
    -w /home/node/app \
    $NAME \
    bash -c "npm install && npm run test:unit"
