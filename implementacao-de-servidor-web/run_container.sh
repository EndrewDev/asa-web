#!/bin/bash

IMAGE_NAME="ubuntu"
CONTAINER_NAME="dc21774c6984"

DOCKERFILE_PATH="."

PORT="8080"

echo "Construindo a imagem Docker..."
docker build -t $IMAGE_NAME $DOCKERFILE_PATH

if [ $? -ne 0 ]; then
	echo "Erro ao construir a imagem."
	exit 1
fi

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)"  ]; then
	echo "Removendo o container existente..."
	docker rm -f $CONTAINER_NAME
fi

echo "Ininciando o container..."
docker run -d -p $PORT:80 --name $CONTAINER_NAME $IMAGE_NAME

if [ $? -eq 0 ]; then
	echo "Container $CONTAINER_NAME iniciado com sucesso e ouvindo na porta $PORT."
else
	echo "Erro ao iniciar o container."
	exit 1
fi

