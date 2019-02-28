REGISTRY_PREFIX=$1
REGISTRY_USER=$2
REGISTRY_PW=$3
VERSION_TAG=$4

if [ -n $VERSION_TAG ]; then
    VERSION_TAG=":$VERSION_TAG"
fi

printf "logging into registry $REGISTRY_PREFIX ...\n"
docker login --username=$REGISTRY_USER --password=$REGISTRY_PW "https://$REGISTRY_PREFIX"

printf "building images ...\n"

cd ketos_brain_api
printf "building image: $REGISTRY_PREFIX/ketos_brain$VERSION_TAG \n"
docker build -f Dockerfile.ketos_brain_api -t $REGISTRY_PREFIX/ketos_brain$VERSION_TAG .

printf "building image: $REGISTRY_PREFIX/ketos_gui$VERSION_TAG \n"
docker build -f Dockerfile.ketos_gui_server -t $REGISTRY_PREFIX/ketos_gui$VERSION_TAG .

cd ../ketos_preprocessing
printf "building image: $REGISTRY_PREFIX/ketos_preprocessing$VERSION_TAG \n"
docker build -f Dockerfile.ketos_preproc -t $REGISTRY_PREFIX/ketos_preprocessing$VERSION_TAG .

cd ../ketos_annotation
printf "building image: $REGISTRY_PREFIX/ketos_anno$VERSION_TAG \n"
docker build -f Dockerfile.ketos_anno -t $REGISTRY_PREFIX/ketos_anno$VERSION_TAG .


# add building of ketos data

exit
printf "pushing images ...\n"

printf "pushing image: $REGISTRY_PREFIX/ds_analysis$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_analysis$VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ds_opal$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_opal$VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ds_poll_gui$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_poll_gui$VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ds_poll$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_poll$VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ds_queue$VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_queue$VERSION_TAG

printf "finished building an pushing all images for DS-QP ....\n"
