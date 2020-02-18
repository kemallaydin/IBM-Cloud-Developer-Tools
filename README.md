# What is IBM Cloud Developer Tools?
IBM Cloud Developer Tools is an Ubuntu based Docker image that contains IBM Cloud CLI, IBM Cloud Plugins (cloud-functions, cloud-object-storage, container-registry, container-service, dev), Kubernetes CLI (kubectl), OpenShift CLI (oc), Docker CLI, Helm, ZSH and Oh My ZSH.

# How to use this image
## Run an `IBM Cloud Developer Tools` container
Running an IBM Cloud Developer Tools container is simple:

```
$ docker run -d -t --name ibm-cloud-developer-tools kmlaydin/ibm-cloud-developer-tools:latest
```

## Run an `IBM Cloud Developer Tools` container via bind mount

```
$ docker run -d -t --name ibm-cloud-developer-tools -v <LOCAL_PATH>:<CONTAINER_PATH> kmlaydin/ibm-cloud-developer-tools:latest
```

You need to replace the `<LOCAL_PATH>` value with the local folder's path that resides on your host machine and also `<CONTAINER_PATH>` value with the path that is mounted in the container.

## Run an `IBM Cloud Developer Tools` container via Docker-in-Docker

IBM Cloud Developer Tools image doesn't contain Docker Daemon (Docker Server) inside by default. It only contains Docker Client. If you want to use Docker Deemon inside your container, you can mount the host machine's Docker socket in the container. This approach will allow IBM Cloud Developer Tools container to use the ***host machine's Docker Daemon*** to run containers and build images.

```
$ docker run -d -t --name ibm-cloud-developer-tools -v /var/run/docker.sock:/var/run/docker.sock kmlaydin/ibm-cloud-developer-tools:latest
```

## `IBM Cloud Developer Tools` shell access and logs

The `docker exec` command allows you to run commands inside a Docker container. The following command line will give you a zsh shell inside your IBM Cloud Developer Tools container:

```
$ docker exec -it ibm-cloud-developer-tools zsh
```

Logs are available through Docker's `docker logs` command:

```
$ docker logs ibm-cloud-developer-tools
```
