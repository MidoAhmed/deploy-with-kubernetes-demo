#!/bin/bash

# test kubectl access
kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --token=$KUBERNETES_TOKEN \
  --insecure-skip-tls-verify \
  get pods

# kubectl \
#   --kubeconfig=/dev/null \
#   --server=$KUBERNETES_SERVER \
#   --token=$KUBERNETES_TOKEN \
#   --insecure-skip-tls-verify \
#   apply -f ./kube/

# echo "The build number is ${TRAVIS_BUILD_NUMBER}"

# kubectl \
#   --kubeconfig=/dev/null \
#   --server=$KUBERNETES_SERVER \
#   --token=$KUBERNETES_TOKEN \
#   --insecure-skip-tls-verify \
#   set image deployment/pypytest pypytest=<dockerUser>/pypytest:${TRAVIS_BUILD_NUMBER} --record