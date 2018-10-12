# UmanIT web images

## Supported tags
* `5.6`
* `7.0`
* `7.1`
* `7.2`

## Presentation
Web images based on [umanit/php](https://hub.docker.com/r/umanit/php/) images.

The following tools are installed:
* composer (v1.7.2)
* curl
* git
* subversion
* openssh
* openssl
* mercurial
* zlib-dev

The following PHP configuration is made:
* `memory_limit = 256M`
  * For composer, the limit is `-1`
* `date.timezone = Europe/Paris`
* `upload_max_filesize = 200M`
* `post_max_size = 500M`

## Builds commands
* `docker build --no-cache -t umanit/web:5.6 -f ./5.6/Dockerfile . && docker push umanit/web:5.6`
* `docker build --no-cache -t umanit/web:7.0 -f ./7.0/Dockerfile . && docker push umanit/web:7.0`
* `docker build --no-cache -t umanit/web:7.1 -f ./7.1/Dockerfile . && docker push umanit/web:7.1`
* `docker build --no-cache -t umanit/web:7.2 -f ./7.2/Dockerfile . && docker push umanit/web:7.2`

## Notes
We used [composer Dockerfile](https://github.com/composer/docker/blob/master/Dockerfile.template).
