#!/bin/bash

sudo docker-compose down
sudo rm -rf ./db/data/*
if [[ $? -eq 0 ]]; then
  sleep 5
  sudo docker-compose up -d --no-deps --build
  sleep 10
  echo "Data removal and Building success!"
else
  echo "Data removal failed. Aborting build."
  exit 1
fi