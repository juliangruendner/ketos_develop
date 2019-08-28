docker-compose -f docker-compose.prod.yml down
rm -rf ketos_postgres_data
./install_prod_ketos.sh