#! /bin/sh -eu

gem install bundler

# docker-compose.yml で定義した volume に gem をインストールするよう bundler に設定
bundle config set --local path /usr/local/bundle

bundle install -j4

exec "$@"