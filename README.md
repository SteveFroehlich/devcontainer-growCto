# devcontainer-growCto

This repo contains files and example of how to use dev 
containers.

The Dockerfile that will setup the development environment is
[here](.devcontainer/Dockerfile)

To build the image run the scrip:
`build-dev-container-image.sh`

To run the container, run the script:
`run-dev-container.sh`

To ssh into the running container run:
`docker container ls`

Copy the container ID and run:
```
docker container exec -it <container-id> bash
```
Something like:

```
docker container exec -it cfe84450e2d9 bash
```

Then you can run the build command from inside the container like:
`gradle build`

Then start the service via:
`gradle bootRun &`
note the `&` will detach from the process so you can poke around
and test the app in the container eg:
`curl localhost:8080/api/hello`

You can also past into your browser:
`localhost:8080/api/hello`
since the port 8080 is forwarded to your host system you should see the response

