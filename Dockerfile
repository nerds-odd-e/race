FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       libsqlite3-dev \
       libpq-dev \
       pkg-config \
       nodejs \
       tzdata \
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

# Run the app in production and skip development/test gems.
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_WITHOUT="development:test"

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Precompile assets. SECRET_KEY_BASE_DUMMY lets Rails boot for asset
# compilation without the real master key, which is provided at runtime.
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rake assets:precompile

# Container runtime conventions: serve static files (no Nginx in the
# container) and stream logs to stdout instead of log/production.log.
ENV RAILS_SERVE_STATIC_FILES=true \
    RAILS_LOG_TO_STDOUT=true

# Run as an unprivileged user and own the writable paths (SQLite db,
# tmp, log) that the app needs at runtime.
RUN useradd --create-home --shell /bin/bash app \
    && mkdir -p db log tmp \
    && chown -R app:app /app
USER app

EXPOSE 3000

# db:prepare creates and migrates the database if needed, and is safe to
# run repeatedly on an existing database (unlike db:setup, which reseeds).
CMD ["sh", "-c", "bundle exec rake db:prepare && bundle exec puma -C config/puma.rb"]
