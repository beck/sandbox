#!/bin/bash
set -eux
cd $(dirname $0)

# This file is needed because `sam build` fails using go
# ... despite the fact this was init'd using examples from the docs

# "GOARCH=amd64 GOOS=linux" is required otherwise get error:
# fork/exec /var/task/hello-world: exec format error
cd sam-app
GOARCH=amd64 GOOS=linux go build -o hello-world/hello-world ./hello-world
