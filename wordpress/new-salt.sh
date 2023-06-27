echo "==> 🔨 generating new salt"
echo ""
WP_SALT=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
echo $WP_SALT > salt.txt
docker run -it --rm --name injecting-salt -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:3.7-alpine python inject-salt.py