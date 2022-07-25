# Let’s Encrypt + CloudFlare DNS validation in Docker

Renews Let’s Encrypt certificates using CloudFlare DNS verification.

## Production setup

- Docker container is automatically pushed by Github Actions to ECR on master changes.
- ECS Task Definition is updated to the latest version
- Scheduled task in the ECS cluster needs to be updated to the latest version manually
- Task runs every 30 days and updates the certificates in the bucket
- Service needs to be manually restarted to pick up the new certificartes

## Run locally
- Define env variables **CF_API_TOKEN** and **SECRETS_BUCKET**
- Run `run.sh`
- Redeploy the latest application version 