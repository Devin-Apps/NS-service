# Notification Service

![CI Status](https://github.com/Devin-Apps/NS-service/workflows/Continuous%20Integration/badge.svg)
![CD Status](https://github.com/Devin-Apps/NS-service/workflows/Continuous%20Deployment/badge.svg)

This repository contains a Notification Service microservice built with Java and Docker, utilizing Twilio for sending SMS notifications.

## Docker Instructions

### Building the Docker Image

To build the Docker image, run the following command in the project root directory:

```bash
docker build -t notification-service .
```

### Running the Docker Container

To run the Docker container, use the following command:

```bash
docker run -d \
  --name notification-service \
  -p 8080:8080 \
  -e TWILIO_ACCOUNT_SID=your_account_sid \
  -e TWILIO_AUTH_TOKEN=your_auth_token \
  -e TWILIO_PHONE_NUMBER=your_twilio_phone_number \
  notification-service:latest
```

Replace `your_account_sid`, `your_auth_token`, and `your_twilio_phone_number` with your actual Twilio credentials.

## Setup and Deployment Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/Devin-Apps/NS-service.git
   cd NS-service
   ```

2. Set up GitHub Secrets:
   - Go to your GitHub repository settings
   - Navigate to Secrets and add the following:
     - `AWS_ACCESS_KEY_ID`
     - `AWS_SECRET_ACCESS_KEY`
     - `TWILIO_ACCOUNT_SID`
     - `TWILIO_AUTH_TOKEN`
     - `TWILIO_PHONE_NUMBER`

3. Push changes to the `main` branch to trigger the CI/CD pipeline:
   - The CI workflow will build and test the application
   - The CD workflow will build a Docker image, push it to Amazon ECR, and deploy it to Amazon ECS

4. Monitor the deployment:
   - Check the Actions tab in your GitHub repository to see the progress of the CI/CD workflows
   - Once completed, the service should be accessible via the configured AWS ECS endpoint

## Local Development

For local development, you can use the provided scripts:

1. Build the Docker image:
   ```bash
   ./build.sh
   ```

2. Run the Docker container:
   ```bash
   ./run.sh
   ```

Make sure to create a `.env` file with your Twilio credentials before running the container locally.

## Health Check

The service includes a health check endpoint at `/health`. You can use this to monitor the status of the service.

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
