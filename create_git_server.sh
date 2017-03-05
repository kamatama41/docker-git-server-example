#!/usr/bin/env bash

set -eu

PROJECT_ROOT=${PWD}
SERVER_DIR=${PROJECT_ROOT}/work/git-server

rm -rf ${SERVER_DIR}
mkdir -p ${SERVER_DIR}/.ssh ${SERVER_DIR}/git-shell-commands

# Setup public keys
cat ~/.ssh/*.pub > ${SERVER_DIR}/.ssh/authorized_keys

# Create remote Git repository
cp -R ${PROJECT_ROOT}/repos ${SERVER_DIR}

cd ${SERVER_DIR}/repos
for repo in ./*
do
  cd ${repo}
  git init --shared=true
  git add .
  git commit -m "my first commit"
  echo Hello > hello.txt
  git add .
  git commit -m "Add hello.txt"
  cd ..
  git clone --bare ${repo} ${repo}.git
  rm -rf ${repo}
done

# Docker compose
cd ${PROJECT_ROOT}
SERVER_DIR=${SERVER_DIR} docker-compose down
SERVER_DIR=${SERVER_DIR} docker-compose up -d
