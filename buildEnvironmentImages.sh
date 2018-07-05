cd ketos_environment_api

# build tf image
cd docker/ubuntu_jupyter_tf
docker build -t ketos.ai:5043/mlservicecontainer_tf .
cd ../..
docker build -f Dockerfile.API.prodTf -t ketos.ai:5043/mlservicecontainer_prod_tf .

# build r image
cd docker/alpine_jupyter_r
docker build -t ketos.ai:5043/mlservicecontainer_r .
cd ../..
docker build -f Dockerfile.API.prod -t ketos.ai:5043/mlservicecontainer_prod_r .
