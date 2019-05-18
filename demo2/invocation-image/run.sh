#!/bin/sh

action=$CNAB_ACTION
name=$CNAB_INSTALLATION_NAME

case $action in
    install)
    set -eo pipefail
    if [[ "$IMAGE_MAP" == "true" ]]; then
        echo "========="
        echo "Image map"
        echo "========="
        cat /cnab/app/image-map.json | jq
        echo ""
    fi
    echo "=============="
    echo "Create secrets"
    echo "=============="
    user=$(cat /basic-auth-user.txt)
    echo $user | docker secret create basic-auth-user -
    cat /basic-auth-password.txt | docker secret create basic-auth-password -
    echo ""
    echo "================"
    echo "Install OpenFaaS"
    echo "================"
    (cd /cnab/app/faas \
     && docker stack deploy $name -c docker-compose.yml)
    echo ""
    echo "=============="
    echo "Build function"
    echo "=============="
    faas-cli build -f /cnab/app/functions/echo-py.yml --build-arg GATEWAY=$GATEWAY
    echo ""
    echo "==============="
    echo "Deploy function"
    echo "==============="
    sleep 5
    cat /basic-auth-password.txt | faas-cli login --gateway=$GATEWAY --username=$user --password-stdin
    faas-cli deploy -f /cnab/app/functions/echo-py.yml
    echo ""
    echo "============"
    echo "Install done"
    echo "============"
    ;;
    uninstall)
    docker service rm echo-py
    docker stack rm $name
    docker secret rm basic-auth-password
    docker secret rm basic-auth-user
    ;;
    *)
    echo "No action for $action"
    ;;
esac