# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


ローカルで作る場合

postgaresなかったら入れる
$ brew install postgresql@13
※有効化とかしておく

master.keyをec2か既にあるプロジェクトファイルからコピーしてconfigの下に置く

$ bundle install --path vendor/bundle

pgがインストールされなかったら

$ bundle config build.pg --with-pg-config=/usr/local/bin/pg_config
※psqlのpg_configを参照できるようpath指定

再度bundle install

フロント関連

$ yarn install
$ npm install
$ yarn build
$ bundle exec rails assets:precompile RAILS_ENV=production
$ rails s

db関連

$ rails db:create RAILS_ENV=development
$ rails db:migrate RAILS_ENV=development
$ rails db:seed RAILS_ENV=development

