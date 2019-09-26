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
Please note that KETOS has a FHIR server and installs one as part of the installation.

*The config files:*

config_anno_db.env:
this is for a feature, which is still in development. Leave this as is

config_prperoc.env:
This allows you to wire the ketos preprocessing service with its own db.
change the HAPIFHIR_URL to the url of your FHIR server if you have your own, otherwise leave this as is
change the FHIR__CLIENT_VERSION to a version matching your needed fhir client, see here: https://pypi.org/project/fhirclient/


config_brain_db.env:
Configures the ketos brain (central webservice) database. Leave this as is for testing purposes. For production we recommend changing the password

config_brain.env:
Configures the ketos brain webservice. If you are not starting ketos on your local machine change the following:
ML_SERVICE_ADMIN_EMAIL - to an email of your choice
ML_SERVICE_ADMIN_PASSWORD - to a secure admin password
KETOS_HOST=localhost  - to the host of your ketos domain or alternatively the ip

if you would like to use ur own fhir server change the fhir server url accordingly
HAPIFHIR_URL=http://ketos_fhir:8080/fhir/  - to the base url of your fhir server


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


## Step 5 (optional) - Install KETOS test data

After ketos has been set up and you can access you fhir server on https://yourdomain:8080 or https://yourip:8080
you can execute  ``cd /home/ketos & ./init_ketos_fhir.sh`

This will load an example dataset into ketos, which uses a ketos example vocabulary to showcase how data could be analysed.

The demonstration data consists for the IRIS machine learning example dataset (https://archive.ics.uci.edu/ml/datasets/iris) mapped to the following
vocabulary as follows:

sepal length in cm => rateOfGrowth
sepal width in cm => bodyWeight
petal length in cm => bodyHeight
petal width in cm => bodySize
flower type => bodyComposition (values: 'Iris-setosa': 'bad body structure', 'Iris-versicolor': 'good body structure', 'Iris-virginica': 'awesome body structure')

This mapping is for demonstration purposes only and has no bearing on any real life clinical application.

Note, that the ketos installation always creates a feature set called "getting started" which resembles this dataset

## Install your own certificate

Go to your deployment folder and stop ketos `cd /home/ketos & ./stop_prod.sh`
replace the certificates in /ketos/auth with your own certificates (cert and key) and ensure that you keep the same names.
the folder contains a brain- and jupyter- cert and key, both of which have to be replaced. 
The certificates you replace them with will be the same.






