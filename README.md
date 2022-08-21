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

1. Requires `Ruby`, `Bundler`, and `Postgres` to be installed.

2. Clone the repository:

```bash
git clone git@github.com:njbbaer/self-metrics.git && cd self-metrics
```

3. Install dependencies:

```bash
bundle install
```

4. Setup the database

```bash
bundle exec rails db:create
```

4. Run the server:

```bash
bundle exec rails
```

### Run tests

```bash
bundle exec rspec
```

### Download database

Replaces the local database with a copy of production data downloaded from Heroku.

Requires installation of the Heroku CLI.

```bash
bundle exec rake db:download
```
