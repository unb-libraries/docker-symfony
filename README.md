# unblibraries/symfony [![](https://images.microbadger.com/badges/image/unblibraries/symfony:alpine-nginx-php7-3.3.svg)](http://microbadger.com/images/unblibraries/symfony:alpine-nginx-php7-3.3 "Get your own image badge on microbadger.com") [![Build Status](https://travis-ci.org/unb-libraries/docker-symfony.svg?branch=alpine-nginx-php7-3.3)](https://travis-ci.org/unb-libraries/docker-symfony)

A lightweight extensible Symfony docker image, suitable for a development-to-production workflow.

## Quick Start
Looking for a really quick start?

```
git clone -b alpine-nginx-php7-3.3 git@github.com:unb-libraries/docker-symfony.git docker-symfony
cd docker-symfony
docker-compose up -d; docker-compose logs
```

And that's it!

## How To Use
This image offers little benefit on its own, and shines when serving as the base of an extension. Although little documentation exists, [an example of how we extend this image for a production site]() should provide enough for you to get started.

## Repository Tags

|                    Tag                    | Symfony | PHP   | Size                                                                                                                                                                                               | Status                                                                                                                                                    |
|:-----------------------------------------:|--------|-------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| unblibraries/symfony:alpine-nginx-php7-3.3 |  3.3.*  | 7.1.x | [![](https://images.microbadger.com/badges/image/unblibraries/symfony:alpine-nginx-php7-3.3.svg)](http://microbadger.com/images/unblibraries/symfony:alpine-nginx-php7-3.3 "Get your own image badge on microbadger.com") | [![Build Status](https://travis-ci.org/unb-libraries/docker-symfony.svg?branch=alpine-nginx-php7-3.3)](https://travis-ci.org/unb-libraries/docker-symfony) |


## General Use
```
docker run \
       --rm \
       --name symfony \
       -p 80:80 \
       unblibraries/symfony:alpine-nginx-php7-8.x
```

## License
- unblibraries/symfony is licensed under the MIT License:
  - [http://opensource.org/licenses/mit-license.html](http://opensource.org/licenses/mit-license.html)
- Attribution is not required, but much appreciated:
  - `Drupal Symfony Image by UNB Libraries`
