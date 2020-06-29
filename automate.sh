#!/bin/bash

DOCKER_USER=<userdockerhub>
DOCKER_PASS=<passworddockerhub>
tag=$(date '+%d%b%Y')
backendtag=$(docker images | grep backend-numbersapi | awk {'print $3'})
frontendtag=$(docker images | grep frontend-numbersapi | awk {'print $3'})

echo " ===================================================================="
echo "                      build image backend-numbersapi"
echo " ===================================================================="
echo " \n "
cd backend
docker build -t backend-numbersapi:$tag .
echo " \n "
echo " ===================================================================="
echo "                            build finish"
echo " ===================================================================="
echo " \n "
echo " ===================================================================="
echo "                  login docker hub registry"
echo " ===================================================================="
echo " \n "
docker login --username=$DOCKER_USER --password=$DOCKER_PASS
echo " \n "
echo " ===================================================================="
echo "                  push to docker hub registry"
echo " ===================================================================="
echo " \n "
docker tag backend-numbersapi:$tag togattafudo/backend-numbersapi:latest
docker push  togattafudo/backend-numbersapi
docker logout
echo " \n "
echo " ===================================================================="
echo "                      build image frontend-numbersapi"
echo " ===================================================================="
echo " \n "
cd ../frontend
docker build -t frontend-numbersapi:$tag .
echo " \n "
echo " ===================================================================="
echo "                            build finish"
echo " ===================================================================="
echo " \n "
echo " ===================================================================="
echo "                  login docker hub registry"
echo " ===================================================================="
echo " \n "
docker login --username=$DOCKER_USER --password=$DOCKER_PASS
echo " \n "
echo " ===================================================================="
echo "                  push to docker hub registry"
echo " ===================================================================="
echo " \n "
docker tag frontend-numbersapi:$tag togattafudo/frontend-numbersapi:latest
docker push  togattafudo/frontend-numbersapi
docker logout
echo " \n "
echo " ===================================================================="
echo "                  deploy to kubernetes using helm chart"
echo " ===================================================================="
echo " \n "
echo " ===================================================================="
echo "                            backend-numbersapi"
echo " ===================================================================="
echo " \n "
cd ..
helm install backend-numbersapi helm-backend-numbersapi/
echo " \n "
echo " ===================================================================="
echo "                          frontend-numbersapi"
echo " ===================================================================="
echo " \n "
helm install frontend-numbersapi helm-frontend-numbersapi/
echo " \n "
echo " ===================================================================="
echo "                                Done"
echo " ===================================================================="
