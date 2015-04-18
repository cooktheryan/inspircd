# SteveHNH/inspircd Dockerfile

This repository contains a customized **Dockerfile** of [InspIRCd](http://www.inspircd.org/) based on [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/luzifer/inspircd/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

This dockerfile includes a build of inspircd that contains the m_ldapauth.cpp module.

## Base Docker Image

- [debian](https://registry.hub.docker.com/_/debian/)

## Installation

1. Install [Docker](https://www.docker.com/).

2. Pull the automated build of the container from [Dockerhub](http://www.dockerhub.com): `docker pull stevehnh/inspircd`

## Usage

Create a directory containing the configuration for the [InspIRCd](http://www.inspircd.org/) with at least the [inspircd.conf](https://github.com/inspircd/inspircd/blob/master/docs/conf/inspircd.conf.example). For LDAP, also edit the modules.conf LDAP configuration.

Then launch it with your configuration:

```
docker run -d -p 6667:6667 -v /path/to/configure:/inspircd/conf stevehnh/inspircd
```

