FROM ruby:2.7-alpine AS base

ENV BUILD_PACKAGES build-base bash postgresql-dev postgresql-client libxml2 libxslt build-base nodejs-current yarn

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

RUN yarn run build

# TODO install and setup nginx to serve static and proxy to ruby app

## TARGET:

FROM base AS dfd-development

RUN bundle install --with=development --with=test
