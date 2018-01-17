if [ ! -d "/ketos" ]; then
    echo 'creating ketos root directory...'
    sudo mkdir /ketos
    sudo mkdir /ketos/environments_data
    sudo chmod -R 777 /ketos
fi
docker-compose -f docker-compose.yml -p mlservice up -d
docker-compose -f mlService_dockerApi/docker/docker-compose.dev.all.yml -f mlService_dockerApi/docker/docker-compose.dev.yml up -d
./wait-for-it.sh localhost:5432 --timeout=0
until $(curl --output /dev/null --silent --head --fail http://localhost:5001/jupyter); do
    printf '.'
    sleep 1
done
containerId=$(docker ps | grep "docker_api_1" | awk '{print $1}')
python3 startJupyterAndAddToEnvs.py $containerId
