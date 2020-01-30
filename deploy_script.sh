#!/bin/bash

#########################################################################################
##############                                                  #########################
##############        CHANGE BELOW VARABLES                      #########################
##############                                                  #########################
#########################################################################################


PROJECT_NAME="CS50"        # project name
SERVICE_PORT=80           # physical service port
DOCKER_PORT=80            # container port
IMAGE_TAG="1.1"             # docker image version (tag)
NAME_SPACE="development"    # kubernetes name space (development or production or test)
DEPLOYMENT_ENV="development" # kubernetes deployment environment (development or production or test)
MEMORY="512Mi"              # Ram memory capacity
CPU="100m"                  # cpu frequence

VOLUME_NAME=""                  # give your volume a name
VOLUME_DATA_PATH=""             # physical path of your volumes
CONTAINER_VOLUME_PATH=""        # coatainer path of your volume
VOLUME_SIZE=""                  # the size wich could be serve to your volume (in Mi or Gi)

WITH_VOLUME=0


#########################################################################################
##############                                                  #########################
##############        END OF CHANGABLE VARABLES                 #########################
##############                                                  #########################
#########################################################################################




#########################################################################################
##############                                                  #########################
##############  PLEASE DON'T TOUCH ANYTHING AGAIN               #########################
##############      IN THE COMMANDS BELOW                      #########################
##############                                                  #########################
#########################################################################################


if [ $WITH_VOLUME -eq 0 ]
then
    for i in {44..79}
        do
            sed -i "$i s/^/#/"  deployment.yml
        done
fi


sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" deployment.yml
sed -i "s/{{IMAGE_TAG}}/$IMAGE_TAG/g" deployment.yml
sed -i "s/{{DOCKER_PORT}}/$DOCKER_PORT/g" deployment.yml
sed -i "s/{{DEPLOYMENT_ENV}}/$DEPLOYMENT_ENV/g" deployment.yml
sed -i "s/{{SERVICE_PORT}}/$SERVICE_PORT/g" deployment.yml
sed -i "s/{{NAME_SPACE}}/$NAME_SPACE/g" deployment.yml
sed -i "s/{{MEMORY}}/$MEMORY/g" deployment.yml
sed -i "s/{{CPU}}/$CPU/g" deployment.yml



if [ $WITH_VOLUME -eq 1 ]
then
    sed -i "s/{{VOLUME_NAME}}/$VOLUME_NAME/g" deployment.yml
    sed -i "s/{{VOLUME_DATA_PATH}}/$VOLUME_DATA_PATH/g" deployment.yml
    sed -i "s/{{CONTAINER_VOLUME_PATH}}/$CONTAINER_VOLUME_PATH/g" deployment.yml
    sed -i "s/{{VOLUME_SIZE}}/$VOLUME_SIZE/g" deployment.yml
fi

###########################################################################################
#################    THE END                                    ###########################
###########################################################################################

