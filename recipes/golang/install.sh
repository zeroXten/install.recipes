#!/bin/bash

version="1.3.1"

os=$(uname -s)
kernel=$(uname -r)
arch=$(uname -m)

if [[ "$arch" = "x86_64" ]]; then
  arch="amd64"
else
  arch="386"
fi

echo "hi"
