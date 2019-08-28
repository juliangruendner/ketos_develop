# KETOS installation guide

## Step 1 - Get install package and initialise server

Download the latest installation package from this repository: https://github.com/juliangruendner/ketos_develop/tree/master/build_from_images

Connect to your server using ssh
change to the root user `sudo -s` and create a deployment dir `mkdir /home/ketos`

## Step 2 - Unpack installation files

Upload the install package zip to your server and unpack it to your deployment folder

```bash
apt-get update
apt-get install zip
unzip <name_installationspaket>.zip -d /home/ketos
cd /home/ketos
```

## Step 3 - Configure your KETOS environments

KETOS comes with multiple config files for the different services it is composed of.
The config files will be prefilled with default values, however you might want some of these to differ.
Please note that KETOS has a FHIR server as one of its dependencies and requires it to be installed before data requests can be made.
The config files:

config_anno_db.env:
this is for a feature, which is still in development. Leave this as is

config_prperoc.env:
This allows you to wire the ketos preprocessing service with its own db.
The only thing you have to change here is the HAPIFHIR_URL
change the HAPIFHIR_URL to the url of your FHIR serve


config_brain_db.env:
Configures the ketos brain (central webservice) database. Leave this as is for testing purposes. For production we recommend changing the password

config_brain.env:
Configures the ketos brain webservice. If you are not starting ketos on your local machine change the following:
ML_SERVICE_ADMIN_EMAIL - to an email of your choice
ML_SERVICE_ADMIN_PASSWORD - to a secure admin password
HAPIFHIR_URL=http://ketos.ai:8081/gtfhir/base/  - to the base url of your fhir server
KETOS_HOST=localhost  - to the host of your ketos domain or alternatively the ip

ketos.config:
Configures the docker registry which contains all the KETOS services images. Leave this as is for testing purposes or to always pull the newest version.
If you choose to have your own docker registry to host the images, change the configuration accordingly.


## Step 4 - Install KETOS and test

During installation KETOS will set up a folder in root `/ketos` to persist the different research environments and to add the auth files for the nginx reverse proxy used by KETOS and its user interface.

Make sure that your docker installation is allowed to write to this folder.

execute the `cd /home/ketos ./install_prod_ketos.sh` in your deployment folder.

This will take a couple of minutes, after this visit https://yourdomain or https://yourip

Please be aware that you will get a ssl warning in your browser as we ship self created certificates.
to install your own certificates see below


## Install your own certificate

Go to your deployment folder and stop ketos `cd /home/ketos & ./stop_prod.sh`
replace the certificates in /ketos/auth with your own certificates (cert und key) and ensure that you keep the same names.
the folder contains a brain- and jupyter- cert and key, both of which have to be replaced. 
The certificates you replace them with will be the same.






