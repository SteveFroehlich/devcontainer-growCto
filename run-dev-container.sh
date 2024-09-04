#!/bin/sh

current_dir=$(pwd)

docker run -v $current_dir:/app -d -p 8080:8080 devc

