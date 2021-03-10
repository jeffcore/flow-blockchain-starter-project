# Flow Blockchain Development Environment with Docker

WORK IN PROGRESS

Using Flow-CLI, Flow Emulator, Go and React with Docker Containers

## How to use

1. git clone this repo
2. install docker
3. cd to root of project
4. run $ docker-compose up emulator
5. run $ docker-compose build cli
6. run $ docker-compose up cli
7. connect to cli container
   1. run $ docker ps
   2. get the container id of flowcli conatiner
   3. run $ docker exec -it \<container id \> sh
   4. while in flowcli container you can execute flow commands

## To Do

- [x] Dockerize Flow-CLI (includes Flow Emulator)
- [x] Dockerize Flow Emulator by itself https://github.com/onflow/flow-emulator/blob/master/README.md#building
- [ ] Dockerize Flow Go Environment
- [ ] Dockerize React or VueJS App (haven't decided)
- [ ] Dockerize Deployment
- [ ] Build something and go to the MOON!
