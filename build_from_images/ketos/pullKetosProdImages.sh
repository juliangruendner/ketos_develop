REGISTRY_PREFIX=${REGISTRY_PREFIX:-""}
REGISTRY_USER=${REGISTRY_USER:-""}
REGISTRY_PW=${REGISTRY_PW:-""}
VERSION_TAG=${VERSION_TAG:-""}

if [ -n $VERSION_TAG ]; then
    VERSION_TAG=":$VERSION_TAG"
fi


if [ -n "$REGISTRY_USER" ]  && [ -n "$REGISTRY_PREFIX" ]; then
    printf "logging into registry $REGISTRY_PREFIX ...\n"
    docker login --username=$REGISTRY_USER --password=$REGISTRY_PW "https://$REGISTRY_PREFIX"
fi

printf "pulling Ketos images ...\n"

printf "pulling image: $REGISTRY_PREFIX/ketos_brain$VERSION_TAG \n"
docker pull $REGISTRY_PREFIX/ketos_brain$VERSION_TAG
docker tag $REGISTRY_PREFIX/ketos_brain$VERSION_TAG ketos_brain:latest

printf "pulling image: $REGISTRY_PREFIX/ketos_gui$VERSION_TAG \n"
docker pull $REGISTRY_PREFIX/ketos_gui$VERSION_TAG
docker tag $REGISTRY_PREFIX/ketos_gui$VERSION_TAG ketos_gui:latest

printf "pulling image: $REGISTRY_PREFIX/ketos_preprocessing$VERSION_TAG \n"
docker pull $REGISTRY_PREFIX/ketos_preprocessing$VERSION_TAG
docker tag $REGISTRY_PREFIX/ketos_preprocessing$VERSION_TAG ketos_preprocessing:latest

printf "pulling image: $REGISTRY_PREFIX/ketos_anno$VERSION_TAG \n"
docker pull $REGISTRY_PREFIX/ketos_anno$VERSION_TAG
docker tag $REGISTRY_PREFIX/ketos_anno$VERSION_TAG ketos_anno:latest

printf "pulling image: $REGISTRY_PREFIX/ketos_env_ds$VERSION_TAG \n"
docker pull $REGISTRY_PREFIX/ketos_env_ds$VERSION_TAG
docker tag $REGISTRY_PREFIX/ketos_env_ds$VERSION_TAG ketos_env_ds:latest

printf "pulling image: $REGISTRY_PREFIX/ketos_env_r$VERSION_TAG \n"
docker pull $REGISTRY_PREFIX/ketos_env_r$VERSION_TAG
docker tag $REGISTRY_PREFIX/ketos_env_r$VERSION_TAG ketos_env_r:latest

printf "finished pulling all images for DS-QP ....\n"


