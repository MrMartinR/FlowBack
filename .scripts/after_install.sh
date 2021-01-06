#!/usr/bin/env bash


# Installation process
sudo -s
aws s3 cp --recursive s3://flowback-artifacts/ /app/
docker container rm -f $(sudo docker container ls -aq)
docker run -v /app:/app -v /bundle_cache:/usr/local/bundle -w /app ruby:2.6.5 gem install bundler:2.2.2
docker run -v /app:/app -v /bundle_cache:/usr/local/bundle -w /app ruby:2.6.5 bundle install
export SECRET_KEY_BASE="81a320f8221f3c1286191f5bc6ae13d7f5e048dbe627dd34b8985296d0e4375c4fe15f822f66d1ef1c27741510ccba9d33a07ab8cf507ae8c66fdc2df2c77fc6"
docker run -d -v /app:/app -v /bundle_cache:/usr/local/bundle -e SECRET_KEY_BASE -p 80:80 -w /app ruby:2.6.5 bundle exec rails s -e production -p 80 -b 0.0.0.0
