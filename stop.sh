docker exec docker_api_1 bash -c 'rm -rf /mlenvironment/models/*'
python3 stopAllEnvs.py
docker-compose -f docker-compose.yml -p mlservice stop
docker-compose -f ketos_environment_api/docker/docker-compose.dev.all.yml -f ketos_environment_api/docker/docker-compose.dev.yml stop