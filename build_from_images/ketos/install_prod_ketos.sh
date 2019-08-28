source ./ketos.config

if [[ $(which docker) ]]; then
    echo "docker already installled, version is: "
    docker -v
    
else
    echo "docker not installed, installing docker:"
    cd ~/ds_deployment/ds_develop
    ./install_docker.sh
fi


if [[ -n $REGISTRY_PREFIX ]]; then
    printf "**** registry fround pulling images from $REGISTRY_PREFIX ...\n\n"
   ./pullKetosProdImages.sh
fi


mkdir -p /ketos/auth
cp ./auth/* /ketos/auth


./start_prod.sh

printf "\n ketos will start a user interface on port 443 of your server\n"
