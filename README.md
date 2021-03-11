# Flow Blockchain Development Environment with Docker

WORK IN PROGRESS

Using Flow-CLI, Flow Emulator, Go Gin and React with Docker Containers

## To Do

- [x] Dockerize Flow-CLI
- [x] Dockerize Flow Emulator (using 2nd instance of Flow CLI)
- [x] Dockerize Flow Go Environment
- [ ] Dockerize React or VueJS App (haven't decided)
- [ ] Dockerize Deployment
- [ ] Build something and go to the MOON!

## How to use

### Clone Repo

1. git clone this repo
2. install docker
3. cd to root of project

### Start Flow Emulator (using Flow CLI)

1. run $ docker-compose build emulator
2. run $ docker-compose up emulator

### Start Flow CLI (used to run commands on project)

1. run $ docker-compose build cli
2. run $ docker-compose up cli
3. connect to flow-cli container
   1. run $ docker ps
   2. get the container id of flow-cli container
   3. run $ docker exec -it \<container id \> sh
   4. while in flow-cli container you can execute flow commands on your project

### Start API - Using Go Gin and Flow Go SDK

1. run $ docker-compose build api
2. run $ docker-compose up api
3. access app via http://localhost:8066/
