#!/bin/sh

docker build --tag devc -f .devcontainer/Dockerfile .

echo 'done building docker image'
