#!/bin/bash
set -e

# Poll the local port to check if Nginx responds
for i in {1..10}; do
    if curl -s http://localhost | grep -q "Welcome to nginx"; then
        echo "Application is healthy!"
        exit 0
    fi
    echo "Waiting for service to start..."
    sleep 5
done

echo "Service validation failed."
exit 1
