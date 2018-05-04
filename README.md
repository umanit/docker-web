# UmanIT web images

## Supported tags
* `5.6`
* `7.0`
* `7.1`
* `7.2`

## Presentation
Web images based on [umanit/php](https://hub.docker.com/r/umanit/php/) images.

The following tools are installed:
* composer (v1.6.4)
* curl
* git
* subversion
* openssh
* openssl
* mercurial
* zlib-dev

The following PHP configuration is made:
* `memory_limit = -1`
* `date.timezone = Europe/Paris`
* `upload_max_filesize = 200M`
* `post_max_size = 500M`

## Notes
We used [composer Dockerfile](https://github.com/composer/docker/blob/master/Dockerfile.template).
