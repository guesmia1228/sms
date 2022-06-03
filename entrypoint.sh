#! /bin/bash
set -e

[ -e tmp/pids/server.pid ] && rm tmp/pids/server.pid

bundle install
# yarn install

bundle exec rails db:prepare
bundle exec rails server -p 5000 -b 0.0.0.0 