Grails Dockerfile
====

Dockerfile Repository to build a docker image for Sdkman and Grails with Oracle Java

## Clone the Repository

`$ git clone https://github.com/phudekar/docker-grails.git`

## Build the docker image

`$ docker build .`

You can specify the Grails version

`$ docker build --build-arg GRAILS_VERSION=2.2.1 .`
