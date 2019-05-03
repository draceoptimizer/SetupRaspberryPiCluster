#  Using Docker

This describes the use case and methodology for using the docker images for running application codes.  

## Use Case

The raspberrypi doesn't always have the latest versions of python in its repository; however, the docker image for python is always the latest and runs well.  For thiis reasong
I want to experiment with running docker images for the python processing on the raspberry pi.

##  Building the Image

With Docker, we start with a base image, i.e. python, then we add our special sauce on top of the image.  This starts with defining a
dockerfile and associated script to build the target docker image.  Additionally we will need a script to run the image with all of the correct
configuration parameters.

The goals for customizing the image are:

*  Use the latest python image from any of the swarm nodes
*  create a bind mount from /shared/WeatherAndElectricity-Runtime to /WeatherAndElectricity in the docker image


##  Using the latest python image

On the master node, create _(within this repository)_ the dockerfile.

I have the following instructions:

```bash
FROM python:latest
LABEL version="0.0.0"
LABEL maintainer="Dr. David Race"
WORKDIR /WeatherAndElectricity
```

The first says to using the python:latest docker image, the second and third put version information, and the fourth sets the workdir.

On running the image, I will bind mount my NFS mount point to this workdir.

