# SteveHNH/inspircd Dockerfile

This repository contains a customized **Dockerfile** of [InspIRCd](http://www.inspircd.org/) based on [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/luzifer/inspircd/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

This dockerfile includes a build of inspircd that contains the m_ldapauth.cpp and m_ldapoper.cpp modules.

## Base Docker Image

- [debian](https://registry.hub.docker.com/_/debian/)

## Installation

1. Install [Docker](https://www.docker.com/).

2. git clone this [repo](https://www.github.com/SteveHNH/inspircd.git)

3. Build from the Dockerfile 
```
docker build -t repo/image:tag PATH/TO/DOCKERFILE
```
## Usage

Create a directory containing the configuration for the [InspIRCd](http://www.inspircd.org/) with at least the [inspircd.conf](https://github.com/inspircd/inspircd/blob/master/docs/conf/inspircd.conf.example)

Then launch it with your configuration:

```
docker run -d -p 6667:6667 -v /home/myuser/config:/inspircd/conf repo/image:tag
```

