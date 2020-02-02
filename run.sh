docker build --tag letscf .
docker run -v `pwd`/certs:/dehydrated/certs/ -it --rm letscf:latest
