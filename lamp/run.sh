NAME=${PWD##*/}
NETWORK="${NAME}-network"
IMAGE="${NAME}-image"
DB="${NAME}_db"
DBIMAGE="${NAME}-db-image"

echo "==> stopping and removing any old instances"
docker stop $NAME
docker rm $NAME
docker stop $DB
docker rm $DB

set -e

echo "==> creating ${NETWORK}"
docker network create -d bridge $NETWORK || true

echo "==> building $IMAGE"
DOCKER_BUILDKIT=1 docker build -t $IMAGE -f Dockerfile .

echo "==> building postgres image"
DOCKER_BUILDKIT=1 docker build -t $DBIMAGE -f Dockerfile.db .

echo "==> starting postgres"

docker run \
  -d \
  --name $DB \
  --network=$NETWORK \
  -e POSTGRES_PASSWORD=password \
  -e POSTGRES_USER=dev \
  -e POSTGRES_DATABASE=lamp \
  -p 5555:5432 \
  $DBIMAGE

echo "==> starting $NAME"

docker run --rm -d \
  --name $NAME \
  -p 8080:80 \
  -v "$(pwd)/src":/var/www/html \
  --network=$NETWORK \
  -e DB_NAME_server=$DB \
  -e DB_NAME_name=dev \
  -e DB_NAME_user=lamp \
  -e DB_NAME_pass=password \
  $IMAGE

echo "===> $NAME: http://localhost:8080/"