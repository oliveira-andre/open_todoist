bundle check || bundle install
rm -f tmp/pids/server.pid && bundle exec foreman start
