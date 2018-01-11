# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

RUN apt-get update
RUN apt-get install -y mysql-client
RUN apt-get install -y vim

# Copy glide files that seldom change and perform glide install
# first to create a docker layer not affected by other more volatile files
ADD ./glide.lock /go/src/github.com/convox-golang/glide.lock
ADD ./glide.yaml /go/src/github.com/convox-golang/glide.yaml

# Set ENV
ENV ENV production
ENV PORT 8080

# Build the app inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
RUN curl https://glide.sh/get | sh

# Install all dependencies first to create a docker layer
# before copying the local packages since dependencies change
# less frequently, and by creating a docker layer here
# docker does not need to re-run glide install so frequently
RUN cd /go/src/github.com/convox-golang && glide install

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/convox-golang

RUN cd /go/src/github.com/convox-golang && go install
