# Let’s Encrypt + CloudFlare DNS validation in Docker

Renews Let’s Encrypt certificates using CloudFlare DNS verification.

- Specify missing config variables in `config`
- Build `docker build --tag letscf .`
- Run `docker run -v $(pwd)/certs:/dehydrated/certs/ -it --rm letscf:latest`
- Upload certs from `${PWD}/certs` to S3 for example.
