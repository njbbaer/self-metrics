# Self Metrics

[![Maintainability](https://api.codeclimate.com/v1/badges/97d3f6de5aca55f1f21b/maintainability)](https://codeclimate.com/github/njbbaer/self-metrics/maintainability)

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

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