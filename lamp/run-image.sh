
NAME=${PWD##*/}

echo "==> stopping and removing any old instances"

docker stop $NAME
docker rm   $NAME

docker stop "lamp_db"
docker rm   "lamp_db"

echo "==> creating lamp_network"
docker network create -d bridge lamp_network || true

echo "==> building lamp image"
DOCKER_BUILDKIT=1 docker build -t $NAME -f Dockerfile .

echo "==> starting database"

docker run \
  -d \
  --name "lamp_db" \
  --network=lamp_network \
  -e POSTGRES_PASSWORD=password \
  -e POSTGRES_USER=dev \
  -e POSTGRES_DATABASE=lamp \
  -p 5555:5432 \
  "lamp_db"

echo "==> starting $NAME"

docker run --rm -d \
  --name $NAME \
  -p 8080:80 \
  -v "$(pwd)/src":/var/www/html \
  --network=lamp_network \
  -e DB_NAME_server="lamp_db" \
  -e DB_NAME_name=dev \
  -e DB_NAME_user=lamp \
  -e DB_NAME_pass=password \
  lampimage

echo "===> $NAME image: http://localhost:8080/"