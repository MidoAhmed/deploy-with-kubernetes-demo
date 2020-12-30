#!/bin/sh
echo "update our .k8s/*.deployment.yml files with the Docker image version"
sed -i "s/VERSION/${TRAVIS_BUILD_NUMBER}/g" .k8s/mongo.deployment.yml .k8s/nginx.deployment.yml .k8s/node.deployment.yml .k8s/redis.deployment.yml
cat .k8s/*.deployment.yml | grep 'image:'
