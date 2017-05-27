FROM ruby:2.4.1-alpine

ENV APP_ROOT /usr/src/skelton51

WORKDIR $APP_ROOT

EXPOSE 3000

RUN \
  apk --update add \
    build-base \
    git \
    nodejs \
    postgresql-dev \
    postgresql-client && \
  rm -rf /var/cache/apk/* && \
  npm install -g yarn && \
  rm -rf /tmp/*

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
COPY package.json $APP_ROOT
COPY yarn.lock $APP_ROOT

RUN \
  bundle config --global jobs 4 && \
  bundle install && \
  yarn install --ignore-optional --pure-lockfile

COPY . $APP_ROOT

CMD bin/rails s -b 0.0.0.0 -p 3000
