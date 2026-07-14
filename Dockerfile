FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       libsqlite3-dev \
       git \
       ca-certificates \
       curl \
       libssl-dev \
       libreadline-dev \
       libyaml-dev \
       libffi-dev \
       zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV RBENV_ROOT=/usr/local/rbenv
ENV PATH="$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH"

RUN git clone https://github.com/rbenv/rbenv.git "$RBENV_ROOT" \
    && git clone https://github.com/rbenv/ruby-build.git "$RBENV_ROOT/plugins/ruby-build"

WORKDIR /app

COPY .ruby-version ./
RUN rbenv install "$(cat .ruby-version)" \
    && rbenv global "$(cat .ruby-version)"

RUN gem install bundler

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["sh", "-c", "bundle exec rake db:setup db:migrate; bundle exec puma -C config/puma.rb"]
