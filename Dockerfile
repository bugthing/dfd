FROM ruby:2.7-alpine AS base

ENV BUILD_PACKAGES build-base bash postgresql-dev libxml2 libxslt build-base nodejs-current yarn

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN mkdir /usr/app
WORKDIR /usr/app

RUN gem update bundler

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
RUN bundle install --without=development --without=test

COPY package.json /usr/app/
COPY yarn.lock /usr/app/
RUN yarn install

COPY . /usr/app

## TARGET:

FROM base AS dfd-production

CMD rackup -o 0.0.0.0

## TARGET:

FROM base AS dfd-development

RUN bundle install

CMD foreman start
