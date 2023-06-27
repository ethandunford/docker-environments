echo "==> 🔨 creating data directory"
mkdir -p data
echo "==> 🗑️ removing any old MySQL containers (wp-db-$1)"
docker stop wp-db-$1
echo "==> 🚀 spinning up new mysql instance (wp-db-$1)"
docker run \
        -v "$(pwd)":/root \
        -v "$(pwd)/data":/var/lib/mysql \
        --rm \
        --network=wordpress-network \
        --name wp-db-$1 \
        -d \
        -e MYSQL_ROOT_PASSWORD=password \
	--label=com.centurylinklabs.watchtower.enable=false \
        mysql:latest
sleep 20
echo "==> 🔨 creating the wordpress database if needed"
docker exec -it wp-db-$1 /bin/bash  \
        -c "mysql -u root -ppassword < /root/seed.sql"
# docker exec -it db /bin/bash  \
# -c "mysql -u root -ppassword --database=wordpress< /root/wordpress.sql"
