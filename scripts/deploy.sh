#!/bin/bash

# test kubectl access
echo "CMD -> kubectl get pods"
kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --token=$KUBERNETES_TOKEN \
  --insecure-skip-tls-verify \
  get pods

echo "CMD -> kubectl apply -f ./.k8s"
kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --token=$KUBERNETES_TOKEN \
  --insecure-skip-tls-verify \
  apply -f ./.k8s/

echo "The build number is ${TRAVIS_BUILD_NUMBER}"

kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --token=$KUBERNETES_TOKEN \
  --insecure-skip-tls-verify \
  set image -f ./.k8s/ \
  node-codewithdan=$DOCKER_ACCT/node-codewithdan:${TRAVIS_BUILD_NUMBER} \
  mongo=$DOCKER_ACCT/mongo:${TRAVIS_BUILD_NUMBER} \
  nginx=$DOCKER_ACCT/nginx:${TRAVIS_BUILD_NUMBER} \
  redis=$DOCKER_ACCT/redis:${TRAVIS_BUILD_NUMBER} \
   --record