FROM ruby:2.7

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       libsqlite3-dev \
       default-libmysqlclient-dev \
       nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 1.13.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle _1.13.2_ install

COPY . .

EXPOSE 3000

CMD ["sh", "-c", "bundle exec rake db:setup db:migrate; bundle exec puma -C config/puma.rb"]
