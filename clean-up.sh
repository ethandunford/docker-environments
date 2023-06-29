echo "==> cleaning up!"

for i in $(ls -d */); 
    do 
        echo "==> removing ${i%%/}"
        docker network rm "${i%%/}-network";
        docker stop ${i%%/};
        docker rm  ${i%%/};
        docker stop "${i%%/}_db";
        docker rm  "${i%%/}_db";
        docker image rm "${i%%/}-image";
        docker image rm "${i%%/}-db-image";
    done