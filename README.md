# Enrise Default Backend

Enrise styled default backend container for Nginx ingress controllers in Kubernetes clusters.

![Example](example.jpg)

# Details

This container is built to follow the [Nginx default backend specs](https://kubernetes.github.io/ingress-nginx/user-guide/default-backend/) which means:
* / serves a HTTP 404 Not Found response
* /healtz serves a HTTP 200 OK response

# Usage

Using this default backend can be done by setting the following values for the Nginx ingress controller Helm chart:

```yaml
defaultBackend:
  image:
      repository: enrise/default-backend
      tag: latest
```

# Building & modifying

Feel free to modify anything inside the html directory as you see fit. Afterwards, run these commands to test it out:

```shell script
$ docker build -t enrise/default-backend:dev .
$ docker run --rm -ti -p 8000:80 enrise/default-backend:dev
```
or to debug / see what's in the container:

```shell script
$ docker run --rm -ti -p 8000:80 enrise/default-backend:dev sh
```
