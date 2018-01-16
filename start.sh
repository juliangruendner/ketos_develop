docker-compose -f docker-compose.yml -p mlservice up -d
docker-compose -f mlService_dockerApi/docker/docker-compose.dev.all.yml -f mlService_dockerApi/docker/docker-compose.dev.yml up -d

containerId=$(docker ps | grep "docker_api_1" | awk '{print $1}')
python3 startJupyterAndAddToEnvs.py $containerId
