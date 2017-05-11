#!/bin/bash -e

pushd $(dirname $0)/..
  export GOPATH=$PWD
  export PATH=$GOPATH/bin:$PATH

  pushd src/github.com/pivotal-cf-experimental/redis-example-service-adapter
    go get -v github.com/tools/godep
    godep restore

    go install -v github.com/onsi/ginkgo/ginkgo

    ./scripts/run-tests.sh
  popd
popd
