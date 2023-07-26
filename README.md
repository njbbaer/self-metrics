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

3. Install Bundler dependencies:

```bash
bundle install
```

4. Setup database

```bash
bundle exec rails db:setup
```

5. Run server:

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

## Run tests

```bash
bundle exec rspec
```
