# KETOS Development

KETOS closes the gap between research and the clinical application of machine learning models. The platform is named after the Greek word for sea monster, as it relies on Docker (whale) to provide lightweight encapsulated development environments to researchers. The system provides a platform that allows researchers and machine learning experts to create their own environment for development. It allows them to train their models on pre-processed, standardized data and deploy them by making them accessible from the outside via a webservice. It provides statisticians, biometricians and collaborating medical informaticians with the ability to develop their models and then deploy them, by standardizing the data retrieval and webservice deployment process.



## Installing from images

To install the newest version of KETOS from images please refer to build_from_images/ketos/README.md of this repository

## Getting Started for development

### Prerequisites:

Ketos requires Docker (https://www.docker.com/community-edition) to be installed on the host machine and the KETOS GUI requires nodejs and npm (see the following link for installation https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04)

### Basic KETOS Instance

The Ketos application is a microservice architecture, which runs multiple services on docker containers. Each service and the ketos gui are kept in separate repositories, which are merged into one using this (main) repository.

to pull all the subrepositories execute the `git_update.sh` in the root of this project. - This will pull all the other KETOS repositories for you.


#### Create environment docker images
KETOS needs environment docker images to provide researchers with different Docker environments. These images can be hosted on a Docker registry and shared bewtween KETOS instances. However for the purpose of a simple setup we provide you with a "buildEnvironmentImages.sh" to build the needed images locally.

```bash
buildEnvironmentImages.sh
```

#### Start the basic KETOS microservices

```bash
start.sh
```

For convenience we then provide you with a `start.sh`, which will start a basic ketos instance.


#### Connect KETOS do a data service

KETOS requires a data service, which consists of a FHIR server and a database (for example OMOP).

If you are interested in a working version of OMOP on FHIR see: http://omoponfhir.org/

For the purpose of a simple development environment and to test KETOS we provide a HAPI FHIR server (without OMOP) , which is already preconfigured for you in this repository and automatically set up for you when u start your local ketos development.

#### starting the GUI

To start the KETOS user interface execute the following commands in your shell in the root of this project

```bash
cd ketos_gui
npm install
npm start
```

This starts the ketos user interface on a local server.
Insert the following URL into your browser to access the user interface:
http://localhost:4200 


















