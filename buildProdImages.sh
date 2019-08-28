REGISTRY_PREFIX=${1:-"docker.miracum.org/ketos"}
REGISTRY_USER=$2
REGISTRY_PW=$3
VERSION_TAG=${4:-"v0.2.0"}

if [ -n $VERSION_TAG ]; then
    VERSION_TAG=":$VERSION_TAG"
fi

printf "logging into registry $REGISTRY_PREFIX ...\n"
docker login --username=$REGISTRY_USER --password=$REGISTRY_PW "https://$REGISTRY_PREFIX"

printf "building images ...\n"

cd ketos_brain_api
printf "building image: $REGISTRY_PREFIX/ketos_brain$VERSION_TAG \n"
docker build -f Dockerfile.ketos_brain_api -t $REGISTRY_PREFIX/ketos_brain$VERSION_TAG .

printf "building new gui for image: $REGISTRY_PREFIX/ketos_gui$VERSION_TAG \n"
cd ../ketos_gui && ./build_dist_and_deploy.sh

cd ../ketos_brain_api
printf "building image: $REGISTRY_PREFIX/ketos_gui$VERSION_TAG \n"
docker build -f Dockerfile.ketos_gui_server -t $REGISTRY_PREFIX/ketos_gui$VERSION_TAG .

cd ../ketos_preprocessing
printf "building image: $REGISTRY_PREFIX/ketos_preprocessing$VERSION_TAG \n"
docker build -f Dockerfile.ketos_preproc -t $REGISTRY_PREFIX/ketos_preprocessing$VERSION_TAG .

cd ../ketos_annotation
printf "building image: $REGISTRY_PREFIX/ketos_anno$VERSION_TAG \n"
docker build -f Dockerfile.ketos_anno -t $REGISTRY_PREFIX/ketos_anno$VERSION_TAG .

# build ds and r jupyter image
cd ../ketos_environment_api/docker/jupyter_ds
docker build -t jupyter_ds:latest .

cd ../..
printf "building image: $REGISTRY_PREFIX/ketos_env_ds$VERSION_TAG \n"
docker build -f Dockerfile.API.prod.ds -t $REGISTRY_PREFIX/ketos_env_ds$VERSION_TAG .
docker build -f Dockerfile.API.prod.ds -t $REGISTRY_PREFIX/ketos_env_r$VERSION_TAG .

# add building of ketos data

printf "pushing images ...\n"

printf "pushing image: $REGISTRY_PREFIX/ketos_brain$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ketos_brain$VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ketos_gui$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ketos_gui$VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ketos_preprocessing$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ketos_preprocessing$VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ketos_anno$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ketos_anno$VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ketos_env_ds$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ketos_env_ds$VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ketos_env_r$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ketos_env_r$VERSION_TAG

printf "finished building an pushing all images for DS-QP ....\n"
