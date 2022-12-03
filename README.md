# Self-Metrics

[![CircleCI](https://circleci.com/gh/njbbaer/self-metrics.svg?style=svg)](https://circleci.com/gh/njbbaer/self-metrics)
[![Maintainability](https://api.codeclimate.com/v1/badges/97d3f6de5aca55f1f21b/maintainability)](https://codeclimate.com/github/njbbaer/self-metrics/maintainability)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

A Rails web app for collecting and analyzing personal health data.

Displays metrics, charts, alerts, and achievements to encourage healthy behaviors.

Built for personal use, but open-source to the public.

## Technical Features

- Ruby on Rails web app with Postgres database
- Bootstrap UI with mobile and desktop responsive design
- Deployed to private Heroku instance for personal use
- Security conscious authentication
- Rspec test suite, run automatically with CircleCI
- Code quality and style enforced by CodeClimate

## Screenshots

![self-metrics-screenshot](/app/assets/images/screenshots.png)

## Setup

1. Clone repository:

```bash
git clone git@github.com:njbbaer/self-metrics.git && cd self-metrics
```

2. Install `ruby` and `bundler` with `rbenv`:

```bash
rbenv install
```

3. Install Postgres and create db user:

```bash
sudo apt install postgresql postgresql-contrib
sudo -u postgres createuser -s $USER
```

4. Install Bundler dependencies:

```bash
bundle install
```

5. Setup database

```bash
bundle exec rails db:setup
```

6. Run server:

```bash
bundle exec rails server
```

## Production Setup

First, follow the steps above to set up the app locally. Then perform the following steps:

1. Ensure Node JS is installed:

```bash
sudo apt install nodejs
```

2. Precompile assets:

```bash
bundle exec rails assets:precompile
```

3. Enable service:

```bash
sudo systemctl enable $(pwd)/self-metrics.service
```

4. Start service:

```bash
sudo systemctl start self-metrics
```

5. See instructions below to set up automatic backups.

## Usage

### Run tests

```bash
bundle exec rspec
```

### Backup

Upload a copy of the database to Google Drive.

Note: `google_drive.json` must contain valid oauth credentials.

```bash
bundle exec rake db:backup
```

To set up automatic backups, add the following to your crontab:

Note: `db:backup` must be run at least once first to autorize Google Drive access.

```bash
0 5 * * * cd /path/to/self-metrics && /path/to/shim/bundle exec rake db:backup
```
