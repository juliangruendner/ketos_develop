docker exec docker_api_1 bash -c 'rm -rf /mlenvironment/models/*'
python3 stopAllEnvs.py
docker-compose -f docker-compose.yml -p mlservice stop
docker-compose -f mlService_dockerApi/docker/docker-compose.dev.all.yml -f mlService_dockerApi/docker/docker-compose.dev.yml stop