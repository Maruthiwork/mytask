
#!/bin/bash
set -Eeuo pipefail

cd /opt/mytask

docker compose config -q
docker compose build
docker compose up -d --remove-orphans

docker compose ps
curl --fail --retry 10 --retry-delay 2 http://127.0.0.1/
