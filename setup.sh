#!/bin/bash
minikube stop && minikube delete --all
minikube start --driver=docker
# shellcheck disable=SC2046
eval $(minikube docker-env)
minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable metallb
#	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
#	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
#	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
docker pull alpine:3.12
docker build -t nginx ./srcs/nginx/
docker build -t ftps ./srcs/ftps/
docker build -t influxdb ./srcs/influxdb
docker build -t telegraf ./srcs/telegraf
docker build -t grafana ./srcs/grafana
docker build -t mysql ./srcs/mysql
docker build -t wordpress ./srcs/wordpress
docker build -t phpmyadmin ./srcs/phpmyadmin

kubectl apply -f ./srcs/metallb/metallb.yaml

kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/ftps/volume.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/influxdb/volume.yaml
kubectl apply -f ./srcs/influxdb/influxdb.yaml
kubectl apply -f ./srcs/telegraf/telegraf.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml
kubectl apply -f ./srcs/mysql/volume.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

minikube dashboard