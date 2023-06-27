NAME=${PWD##*/}

echo "==> removing old build"

rm -rf dist

echo "==> building vue image"

DOCKER_BUILDKIT=1 docker build -t $NAME -f Dockerfile .

echo "==> building project $NAME"

docker run --rm \
    -v "$(pwd)":/home/node/app \
    -w /home/node/app \
    $NAME \
    bash -c "npm install && npm run format && npm run lint && npm run type-check && npm run build-only"
