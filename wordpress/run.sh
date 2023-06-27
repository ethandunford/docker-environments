# we use the current folder name as the wp-instance name
# e.g if the folder is called tenantshop then:
# wp container name is wp-tenantshop
# the conntected mysql database container is called wp-db-tenantshop
# the port is also set via a file called port
echo "
        ██╗    ██╗██████╗        ██████╗ ███████╗███╗   ██╗
        ██║    ██║██╔══██╗      ██╔════╝ ██╔════╝████╗  ██║
        ██║ █╗ ██║██████╔╝█████╗██║  ███╗█████╗  ██╔██╗ ██║
        ██║███╗██║██╔═══╝ ╚════╝██║   ██║██╔══╝  ██║╚██╗██║
        ╚███╔███╔╝██║           ╚██████╔╝███████╗██║ ╚████║
         ╚══╝╚══╝ ╚═╝            ╚═════╝ ╚══════╝╚═╝  ╚═══╝                           
"


echo "==> 🔨 loading the port to use"
WP_PORT=$(cat port)
echo "==> ✔️ using port: $WP_PORT"
WP_NAME=${PWD##*/}
echo "==> 🔧 starting up a new WP instance with ID: $WP_NAME"
echo "==> 🔨 creating wordpress-network"
docker network create -d bridge wordpress-network || true
./new-salt.sh
./mysql.sh $WP_NAME $WP_PORT
./wordpress.sh $WP_NAME $WP_PORT