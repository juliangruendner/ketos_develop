cd ketos_environment_api

# build standard environments based on jupyter notebook docker containers

# build ds and r jupyter image
cd ../ketos_environment_api/docker/jupyter_ds
docker build -t jupyter_ds:latest .

cd ../..

printf "building image: environment images \n"
docker build -f Dockerfile.API.prod.ds -t ketos_env_ds:latest .
docker build -f Dockerfile.API.prod.ds -t ketos_env_r:latest .
