# README #

This is a sample sinatra api application withe the following features:

* implements jwt auth
* connects to postgres using active record
* uses tux (command line just like rails console)
* awesome print for better console output

### How to use activerecord here? ###
* Create database

```
#!ruby
bundle exec rake db:create
```

* run a database migration

```
#!ruby
bundle exec rake db:migrate
```

* Create database migration file

```
#!ruby
bundle exec rake db:create_migration NAME=update_customer
```
The migration file will then be found in db/migrate folder

### How do I open tux (rails c alternative for non rails apps)? ###

```
#!ruby
tux -c config.ru
```

### How do I deploy to Heroku ###

This section is not yet ready.

### Who do I talk to? ###

* [medali@yusofleet.com](mailto:medali@yusofleet.com)
* Other community or team contact# sinatra-project
