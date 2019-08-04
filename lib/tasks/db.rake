namespace :db do
  desc "Synchronize local database with production"
  task sync: :environment do
    sh 'rm -f latest.dump'
    sh 'heroku pg:backups:capture'
    sh 'heroku pg:backups:download'
    sh 'bundle exec rails db:setup DISABLE_DATABASE_ENVIRONMENT_CHECK=1'
    sh 'pg_restore --verbose --clean --no-acl --no-owner -d self_metrics_development latest.dump'
  end
end
