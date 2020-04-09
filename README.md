# Dont Forget the Donor

## Run it

Install ruby libraries

    bundle install

Install javasciprt libraries

    yarn install

Start the web servers

    foreman start

Make a request, by [visiting in browser](http://0.0.0.0:9292/) or making an api request:

    curl 'http://0.0.0.0:9292/donors' -H 'Content-Type: application/json' --data '{"name":"Amy"}'

## Development

Guided by [https://ryanbigg.com/2020/02/rom-and-dry-showcase-part-1](this)
and [https://github.com/hanami/controller](this)
and [https://github.com/hanami/view](this)

### Tests

    bundle exec rspec

### DB

Get a docker postgres up and running using this:

    docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
    docker exec -it postgres createdb dfd -U postgres

### Notes

#### Code

Keep things standard:

    bundle exec standardrb --fix

#### Migrations

Use migrations to handle db schema changes

    bundle exec rake "db:create_migration[create_donors]"
    bundle exec rake db:migrate

## Docker

You can run the application in containers using docker-compose, the default is setup for development.

    docker-compose up

When ready to deploy, there is a docker compose file of overrides for a production style execution.

    docker-compose -f docker-compose.yml -f docker-compose.prod.yml up


