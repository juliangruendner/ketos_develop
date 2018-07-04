# ketos_Development

KETOS closes the gap between research and the clinical application of machine learning models. The platform is named after the Greek word for sea monster, as it relies on Docker (whale) to provide lightweight encapsulated development environments to researchers. The system provides a platform that allows researchers and machine learning experts to create their own environment for development. It allows them to train their models on pre-processed, standardized data and deploy them by making them accessible from the outside via a webservice. It provides statisticians, biometricians and collaborating medical informaticians with the ability to develop their models and then deploy them, by standardizing the data retrieval and webservice deployment process.

## Getting Started

### Prerequisites:
Ketos requires Docker (https://www.docker.com/community-edition) to be installed on the host machine and the KETOS GUI requires nodejs and npm (see the following link for installation https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04)

### Basic Ketos Instance
The Ketos application is a microservice architecture, which runs multiple services on docker containers. Each service and the ketos gui are kept in separate repositories, which are merged into one using this (main) repository.

to pull all the subrepositories execute the `git_update.sh` in the root of this project. - This will pull all the other ketos repositories for you.


#### create environment docker images
Ketos needs environment docker images to provide researchers with different docker environments. These images can be hosted on a docker registry and shared bewtween ketos instances. However for the purpose of a simple setup we provide you with a "buildEnvironmentImages.sh" to build the needed images locally.

```bash
buildEnvironmentImages.sh
```

#### start the basic ketos microservices

```bash
start.sh
```

For convenience we then provide you with a `start.sh`, which will start a basic ketos instance composed of the following services:

- ml_service   (brain_api)
- data_pre     (ketos preprocessing service)
- anno_api     (annotation api)

It further starts one basic environment, which can be used for development purposes, as the code of this environment is directly mapped to the host system.

#### connecting ketos do a data service

Ketos requires a data service, which consists of a FHIR server and a database (for example OMOP).

If you are interested in a working version of the OMOP on FHIR server used for KETOS please feel free to contact myself: julian.gruendner@fau.de

For the purpose of a simple development environment and to test ketos you can connect to our KETOS data service online under: http://ketos.ai:8080/gtfhir/base/ , which is already preconfigured for you in this repository

#### starting the GUI

to start the ketos user interface execute the following commands in your shell in the root of this project

```bash
cd ketos_gui
npm install
npm start
```

this starts the ketos user interface on a local server
insert the following URL into your browser to access the user interface
http://localhost:4200 


















