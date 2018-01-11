# Convox Golang Boilerplate

## Description

This repository contains a boilerplate of Golang using Convox with glide as dependency manager.

The advantage of using a docker-based Golang environment is you do not have to setup Go on your local machine -
no need to setup $GOPATH and $GOBIN, etc.

Read more about Convox here: https://convox.com/how

## Running on Local

* git clone https://github.com/mlsaito/convox-golang  
* convox start  
* Visit http://localhost:80 to see working homepage.

## Adding Dependencies

Since this stack uses glide as dependecy manager, you need to install glide on your machine.

Install glide:
* `curl https://glide.sh/get | sh` (Mac or Linux)
* `brew install glide` (Mac OS X via Homebrew)
* `sudo add-apt-repository ppa:masterminds/glide && sudo apt-get update`
* `sudo apt-get install glide` (Ubuntu, etc.)

To add dependency:
* `glide get github.com/streadway/amqp`
* This will automatically update glide.yaml

Read more about glide here: https://glide.sh/
