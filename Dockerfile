FROM ruby:3.2

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       libsqlite3-dev \
       default-libmysqlclient-dev \
       nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 2.4.22

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle _2.4.22_ install

COPY . .

EXPOSE 3000

CMD ["sh", "-c", "bundle exec rake db:setup db:migrate; bundle exec puma -C config/puma.rb"]
