set -e

NAME=${PWD##*/}
IP=$(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')

echo "==> stopping and cleaning any old instances"
docker stop "${NAME}_pytest"
docker rm "${NAME}_pytest"

echo "==> creating python-nextwork"
docker network create -d bridge python-network || true

DOCKER_BUILDKIT=1 docker build -t "${NAME}_pytest" -f Dockerfile.pytest .

docker run \
    --name="${NAME}_pytest" \
    -v "$(pwd)/app":/root \
    --network=python-network \
    -e API_URL="http://$ip:5000" \
    -it "${NAME}_pytest" /bin/bash