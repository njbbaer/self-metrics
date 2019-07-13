# Self Metrics

![self-metrics-screenshot](/app/assets/images/self-metrics.png)

## Documentation

### Clone Production DB into Development

Set heroku remote url, if not already done.
```
heroku git:remote -a self-metrics-njbbaer
```
Capture, download, and import heroku database.
```
heroku pg:backups:capture
heroku pg:backups:download
bundle exec rails db:setup
pg_restore --verbose --clean --no-acl --no-owner -d self_metrics_development latest.dump
```