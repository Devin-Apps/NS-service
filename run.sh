#!/bin/bash

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
else
    echo "Error: .env file not found"
    exit 1
fi

# Run the Docker container
docker run -d \
    --name notification-service \
    -p 8080:8080 \
    -e TWILIO_ACCOUNT_SID=$TWILIO_ACCOUNT_SID \
    -e TWILIO_AUTH_TOKEN=$TWILIO_AUTH_TOKEN \
    -e TWILIO_PHONE_NUMBER=$TWILIO_PHONE_NUMBER \
    notification-service:latest

echo "Notification Service container started"
