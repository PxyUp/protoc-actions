FROM golang:stretch

RUN apt-get update && \
    apt-get -y install git unzip build-essential autoconf libtool

RUN git clone https://github.com/google/protobuf.git && \
    cd protobuf && \
    ./autogen.sh && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    ldconfig && \
    make clean && \
    cd .. && \
    rm -r protobuf

# NOTE: for now, this docker image always builds the current HEAD version of
# gRPC.  After gRPC's beta release, the Dockerfile versions will be updated to
# build a specific version.

RUN go get google.golang.org/grpc

RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get github.com/golang/protobuf/protoc-gen-go

RUN cp /go/bin/protoc-gen-go /usr/bin/
RUN protoc --version

# Get the source from GitHub
# Install protoc-gen-go


RUN git config --global url."git@gitlab.com:".insteadOf "https://gitlab.com/"

RUN git config --global url."git@github.com:".insteadOf "https://github.com/"

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]