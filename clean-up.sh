echo "==> cleaning up!"

for i in $(ls -d */); 
    do 
        echo "==> removing ${i%%/}"
        docker stop ${i%%/};
        docker rm  ${i%%/}
    done