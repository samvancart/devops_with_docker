#! /bin/sh

# --- BEFORE RUNNING ---
# 1. Create file DOCKERHUB_USER.txt in the same directory as this script and copy your Docker Hub username into it (first line).
# 2. Create file DOCKERHUB_TOKEN.txt in the same directory as this script and copy your Docker Hub access token into it (first line).
# ----------------------

# clone git repo given as first argument
git clone $1
# assign current directory path to variable
cwd=$(pwd)
# get path to project (given as second argument)
project_path=$2
cd $project_path
name=$(echo "$2" | awk -F"/" '{print $NF}')
docker build . -t $name
#get Docker Hub username and access token that are stored in separate files.
user=$(head -n 1 $cwd/DOCKERHUB_USER.txt)
token=$(head -n 1 $cwd/DOCKERHUB_TOKEN.txt)
docker login --username=$user --password=$token
docker image tag $name $user/$name:latest
docker image push $user/$name:latest
docker logout
