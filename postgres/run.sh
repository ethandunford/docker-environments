
NAME="${PWD##*/}_db"

echo "==> stopping and cleaning any old pg instances"
docker stop $NAME
docker rm $NAME

echo "==> creating postgres-network"
docker network create -d bridge postgres-network || true

echo "==> building postgres image"
DOCKER_BUILDKIT=1 docker build -t $NAME -f Dockerfile .

echo "==> starting up a new postgres instance with ID: $NAME"

docker run \
-v "$(pwd)":/root \
--rm \
--name $NAME \
--network=postgres-network \
-e POSTGRES_PASSWORD=password \
-e POSTGRES_USER=dev \
-e POSTGRES_DATABASE=postgres \
-p 5432:5432 $NAME