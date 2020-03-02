# Trading API

This project is a Ruby on Rails API for UN/LOCODE search.

The project download locodes zip file from [UNECE](https://www.unece.org/cefact/codesfortrade/codes_index.html), then unzip csv files and import all content to a [PostgreSQL](https://www.postgresql.org/) database.

The API endpoints could be checked with an [Swagger](https://swagger.io/) documentation at the /api-docs endpoint.

## Getting Started

There are two ways to run this project: with [Docker](https://www.docker.com/products/docker-desktop) or local.

### Running Local

```
Ruby version: 2.6.3
Rails version: 6.0.2
```

If you run this project local, you need to change `config/database.yml` file, setting your own database configuration.

Example:
```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: localhost
  user: postgres
  password: your_db_pass
  port: 5432
```

After changes on `database.yml`, you may run the script command `sh start.sh` on the root project directory. This script file has all setup needed to install dependencies, create database ,run migrations, tests and also download and import locodes to database.

### Running with docker

This project has a Dockerfile and docker-compose file to build all environment with two simple commands:

`$ docker-compose build`

`$ docker-compose up`

API documentation: [http://localhost:3000/api-docs](http://localhost:3000/api-docs)

![screen](/screenshots/01.png)
![screen](/screenshots/02.png)

## Running the tests manually

If you would like to run tests manually, in a local installation, just run in your terminal (root project directory):

```
$ bundle exec rails rspec
```
A test coverage report will appear on the end.

```
Coverage report generated for RSpec to /app/coverage. 105 / 105 LOC (100.0%) covered.
```

## Final considerations