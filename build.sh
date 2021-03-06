#!/bin/bash

if groups $USER | grep &>/dev/null '\bdocker\b'; then
  DOCKER="docker"
else
  DOCKER="sudo docker"
fi

$DOCKER run --rm -P -v $(pwd):/src -v $(pwd)/../development-guidelines.pages/:/output/ jojomi/hugo:0.24.1

sudo chown -R $USER:$USER ../development-guidelines.pages/
