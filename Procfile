web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
release: rake db:drop && rake db:create && rake db:migrate && rake db:seed
