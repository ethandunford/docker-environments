set -e
NAME=${PWD##*/}

echo "==> stopping and cleaning any old instances"
docker stop $NAME
docker rm $NAME

echo "==> creating python-nextwork"
docker network create -d bridge python-network || true

echo "==> building python image"
DOCKER_BUILDKIT=1 docker build -t $NAME -f Dockerfile .

docker run \
    --name=$NAME \
    -v "$(pwd)/app":/root \
    --network=python-network \
    -e DB="dbname='pythondb' user='pythondb' password='password' host='db'" \
    -it $NAME /bin/bash