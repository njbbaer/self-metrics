# frozen_string_literal: true

namespace :db do
  task dump: :environment do
    sh "pg_dump -F c self_metrics_#{Rails.env} > backup.dump"
  end

  task restore: :environment do
    raise "Do not use in production!" if Rails.env == "production"

    sh 'bundle exec rails db:setup DISABLE_DATABASE_ENVIRONMENT_CHECK=1'
    sh "pg_restore --clean --dbname self_metrics_#{Rails.env} backup.dump"
  end
end
