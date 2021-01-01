#!/bin/bash

# CLUSTER_CERTIFICATE
echo "$KUBERNETES_CLUSTER_CERTIFICATE" | base64 --decode > cert.crt

cat .k8s/*.deployment.yml | grep 'image:'
updatekube.sh

# test kubectl access
echo "CMD -> kubectl get pods"
kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --token=$KUBERNETES_TOKEN \
  --certificate-authority=cert.crt \
  get pods

echo "CMD -> kubectl apply -f ./.k8s"
kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --token=$KUBERNETES_TOKEN \
  --certificate-authority=cert.crt \
  apply -f ./.k8s/

echo "The build number is ${TRAVIS_BUILD_NUMBER}"

# kubectl \
#   --kubeconfig=/dev/null \
#   --server=$KUBERNETES_SERVER \
#   --token=$KUBERNETES_TOKEN \
#   --certificate-authority=cert.crt \
#   set image -f ./.k8s/ \
#   node-codewithdan=$DOCKER_ACCT/node-codewithdan:${TRAVIS_BUILD_NUMBER} \
#   mongo=$DOCKER_ACCT/mongo:${TRAVIS_BUILD_NUMBER} \
#   nginx=$DOCKER_ACCT/nginx:${TRAVIS_BUILD_NUMBER} \
#   redis=$DOCKER_ACCT/redis:${TRAVIS_BUILD_NUMBER} \
#    --record