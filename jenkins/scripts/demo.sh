#!/usr/bin/env bash
set -x
mvn jar:jar install:install help:evaluate -Dexpression=project.name
set +x

echo 'Extract the project name from pom'
set -x
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
set +x

echo 'Extract the project version from pom'
set -x
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
set +x

set -x
java -jar target/${NAME}-${VERSION}.jar
