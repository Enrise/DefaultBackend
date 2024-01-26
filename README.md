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
  enabled: true
  name: enrise-default-backend
  port: 8000
  image:
    registry: docker.io
    image: enrise/default-backend
    tag: latest
    pullPolicy: Always
    runAsUser: 100
    readOnlyRootFilesystem: false
```

This config is tested with version 4.9.0 of the ingress-nginx Helm chart.

# Building & modifying

Feel free to modify anything inside the html directory as you see fit. Afterwards, run these commands to test it out:

```shell script
$ docker build -t enrise/default-backend:dev .
$ docker run --rm -ti -p 8000:8000 enrise/default-backend:dev
```
and you can now check http://localhost:8000.

Or to debug / see what's in the container:

```shell script
$ docker run --rm -ti -p 8000:8000 enrise/default-backend:dev sh
```
