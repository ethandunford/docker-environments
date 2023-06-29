
NAME="${PWD##*/}"
NETWORK="${NAME}-network"
IMAGE="${NAME}-image"

echo "==> stopping and removing any old instances"
docker stop $NAME
docker rm $NAME

set -e

echo "==> creating ${NETWORK}"
docker network create -d bridge $NETWORK || true

echo "==> building ${IMAGE}"
DOCKER_BUILDKIT=1 docker build -t $IMAGE -f Dockerfile .

echo "==> starting postgres"

docker run \
-v "$(pwd)":/root \
--rm \
--name $NAME \
--network=postgres-network \
-e POSTGRES_PASSWORD=password \
-e POSTGRES_USER=dev \
-e POSTGRES_DATABASE=postgres \
-p 5432:5432 \
$IMAGE