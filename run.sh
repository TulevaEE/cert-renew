docker build --tag letscf .
docker run -it --rm -e CF_API_TOKEN="$CF_API_TOKEN" letscf:latest