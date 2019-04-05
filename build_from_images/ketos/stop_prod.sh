source ./ketos.config

printf "######################\Stopping Ketos ...\n######################\n\n"
docker-compose -f docker-compose.prod.yml stop
