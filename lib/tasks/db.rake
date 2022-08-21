# frozen_string_literal: true

namespace :db do
  desc 'Replaces the local database with a copy downloaded from Heroku'
  task download: :environment do
    raise "Do not use in production!" if Rails.env == "production"

    sh 'rm -f latest.dump'
    sh 'heroku pg:backups:capture'
    sh 'heroku pg:backups:download'
    sh 'bundle exec rails db:setup DISABLE_DATABASE_ENVIRONMENT_CHECK=1'
    sh 'pg_restore --verbose --clean --no-acl --no-owner -d self_metrics_development latest.dump'
  end
end
