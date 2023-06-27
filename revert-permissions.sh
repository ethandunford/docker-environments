# Sometimes docker will change the user and group to root
sudo chown -R $(id -u):$(id -g) wordpress