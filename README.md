# Self Metrics

![self-metrics-screenshot](/app/assets/images/self-metrics.png)

## Infrastructure
The production version of this application is deployed to Heroku.

### Configure CLI
```
heroku git:remote -a self-metrics-njbbaer
```

### Clone DB into Development
```
heroku pg:backups:capture
heroku pg:backups:download
bundle exec rails db:setup DISABLE_DATABASE_ENVIRONMENT_CHECK=1
pg_restore --verbose --clean --no-acl --no-owner -d self_metrics_development latest.dump
```