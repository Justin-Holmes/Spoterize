web:    bundle exec rails s -p $PORT
worker: bundle exec rake environment resque:work QUEUE=*
resque: env TERM_CHILD=1 RESQUE_TERM_TIMEOUT=9 bundle exec rake resque:work
