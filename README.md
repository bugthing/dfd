# Dont Forget the Donor


## Development

Guided by [https://ryanbigg.com/2020/02/rom-and-dry-showcase-part-1](this)

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

