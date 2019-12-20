#!/bin/bash
set -ex

docker pull crates/wslbridge2

docker rm wslbridge2 || true
docker create --name wslbridge2 crates/wslbridge2

docker cp wslbridge2:/wslbridge2-backend .
docker cp wslbridge2:/wslbridge2-backend.sha256 .

cat wslbridge2-backend.sha256
sha256sum -c wslbridge2-backend.sha256

rm -rf backend || true
mkdir -p backend
mv wslbridge2-backend* backend/
