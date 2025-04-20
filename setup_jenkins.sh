#!/bin/bash

docker volume rm jenkins_home || true
docker volume create jenkins_home

export USER_CHOCOLATEEN_PASSWORD="chocolateen_password"
export USER_VAUGIE_G_PASSWORD="vaugie_password"
export USER_I_DONT_KNOW_PASSWORD="idk_password"
export USER_NASSO_PASSWORD="nasso_password"

docker pull jenkins/jenkins:lts
docker build -t dop-jenkins . && \
docker run \
  --rm \
  -p 8080:8080 \
  --name jenkins \
  -v "jenkins_home:/var/jenkins_home" \
  -v "./my_marvin.yml:/var/jenkins_home/my_marvin.yml" \
  -v "./job_dsl.groovy:/var/jenkins_home/job_dsl.groovy" \
  -e 'JAVA_OPTS=-Djenkins.install.runSetupWizard=false' \
  -e 'CASC_JENKINS_CONFIG=/var/jenkins_home/my_marvin.yml' \
  -e 'USER_CHOCOLATEEN_PASSWORD'="$USER_CHOCOLATEEN_PASSWORD" \
  -e 'USER_VAUGIE_G_PASSWORD'="$USER_VAUGIE_G_PASSWORD" \
  -e 'USER_I_DONT_KNOW_PASSWORD'="$USER_I_DONT_KNOW_PASSWORD" \
  -e 'USER_NASSO_PASSWORD'="$USER_NASSO_PASSWORD" \
  dop-jenkins
