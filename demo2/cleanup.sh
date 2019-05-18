#!/bin/sh

name=${name:-faas}

docker service rm echo-py
docker stack rm $name
docker secret rm basic-auth-password
docker secret rm basic-auth-user
