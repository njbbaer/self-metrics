# frozen_string_literal: true

namespace :db do
  task backup: :environment do
    filename = get_backup_filename
    pg_dump(filename)
    upload_google_drive(filename)
  end

  task restore: :environment do
    sh 'bundle exec rails db:setup DISABLE_DATABASE_ENVIRONMENT_CHECK=1'
    sh "pg_restore --clean --dbname #{database_name} backup.dump"
  end

  def database_name
    "self_metrics_#{Rails.env}"
  end

  def get_backup_filename
    date_string = Time.now.strftime('%Y%m%d')
    "backup_#{date_string}.dump"
  end

  def pg_dump(filename)
    sh 'mkdir -p backups'
    sh "pg_dump --format custom #{database_name} > backups/#{filename}"
  end

  def upload_google_drive(filename)
    session = GoogleDrive::Session.from_config("google_drive.json")
    session.upload_from_file("backups/#{filename}", filename, convert: false, parents: ['1ZFoGRkIZmkM0SIof62YZH8ZOniYX2iRV'])
  end
end
