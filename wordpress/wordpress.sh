echo "==> 🗑️ removing any old WP containers (wp-$1)"
docker stop wp-$1
echo "==> create our local volumes..."
mkdir -p wp-content
echo "==> set the correct permisions"
sudo chmod -R 777 wp-content/
sudo chown -R www-data:www-data wp-content/
echo "==> 🚀 spinning up new wordpress instance (wp-$1)"
docker run \
        --rm \
        --name wp-$1 \
        --network=wordpress-network \
        -p $2:80 \
        -d \
        -v "$(pwd)":/root \
        -v "$(pwd)/wp-content":/var/www/html/wp-content/ \
        -e "DB_HOST"="wp-db-$1" \
	--label=com.centurylinklabs.watchtower.enable=false \
        wordpress:5.3.2-php7.4-apache
sleep 10
echo "==> 💉 injecting wp config"
docker exec -u root -it wp-$1 /bin/bash  \
        -c "cp /root/wp-config.php /var/www/html/"
docker exec -u root -it wp-$1 /bin/bash  \
	-c "/root/install-sendmail.sh"
echo "==> 🎉 congratulations your $1 instance should now be running at http://localhost:$2/"
