source ./ketos.config

printf "######################\nInitialising Ketos ...\n######################\n\n"

docker-compose -f docker-compose.prod.yml up -d
