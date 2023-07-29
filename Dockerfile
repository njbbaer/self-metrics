FROM ruby:3.1.2

RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client sqlite3 libsqlite3-dev gosu && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /self-metrics
WORKDIR /self-metrics
COPY Gemfile* ./
RUN bundle install
COPY . .

RUN bin/rails assets:precompile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]