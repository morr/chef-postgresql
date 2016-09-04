# chef-postgresql

[![Circle CI](https://circleci.com/gh/Soliah/chef-postgresql.svg?style=svg)](https://circleci.com/gh/Soliah/chef-postgresql)

## Description

Install and configure [PostgreSQL](http://www.postgresql.org) using the [PostgreSQL Apt Repository](https://wiki.postgresql.org/wiki/Apt).

Currently supported versions:

* `9.5`

The default version is `9.5`.

## Requirements

### Supported Platforms

The following platforms are supported by this cookbook, meaning that the recipes run on these platforms without error:

- Ubuntu 14.04
- Ubuntu 16.04

### Chef

This cookbook requires Chef >= 12.9 due to the use of the built in `apt_repository` resource.

### Dependencies

* [locale](https://github.com/ChowOps/chef-locale)


## Recipes

* `postgresql` - Set up the apt repository and install dependent packages
* `postgresql::client` - Client programs for PostgreSQL 9.x
* `postgresql::configuration` - Internal recipe to manage configuration files
* `postgresql::data_directory` - Internal recipe to setup the data directory
* `postgresql::postgis` - Geographic objects support for PostgreSQL 9.x
* `postgresql::server` - Object-relational SQL database, version 9.x server
* `postgresql::service` - Internal recipe to declare the system service
* `postgresql::setup_databases` - Internal recipe to manage specified databases
* `postgresql::setup_extensions` - Internal recipe to manage specified database extensions
* `postgresql::setup_users` - Internal recipe to manage specified users

## LWRP

### Users

```ruby
# create a user
postgresql_user "myuser" do
  superuser false
  createdb false
  login true
  replication false
  password "mypassword"
end

# create a user with an MD5-encrypted password
postgresql_user "myuser" do
  superuser false
  createdb false
  login true
  replication false
  encrypted_password "667ff118ef6d196c96313aeaee7da519"
end

# drop a user
postgresql_user "myuser" do
  action :drop
end
```

Or add users via attributes:

```json
"postgresql": {
  "users": [
    {
      "username": "dickeyxxx",
      "password": "password",
      "superuser": true,
      "replication": false,
      "createdb": true,
      "createrole": false,
      "inherit": true,
      "replication": false,
      "login": true
    }
  ]
}
```

### Databases and Extensions

```ruby
# create a database
postgresql_database "mydb" do
  owner "myuser"
  encoding "UTF-8"
  template "template0"
  locale "en_US.UTF-8"
end

# install extensions to database
postgresql_extension "hstore" do
  database "mydb"
end

# drop dblink extension
postgresql_extension "dblink" do
  database "mydb"
  action :drop
end

# drop a database
postgresql_database "mydb" do
  action :drop
end
```

Or add the database via attributes:

```json
"postgresql": {
  "databases": [
    {
      "name": "my_db",
      "owner": "dickeyxxx",
      "template": "template0",
      "encoding": "UTF-8",
      "locale": "en_US.UTF-8",
      "extensions": ["hstore", "dblink"],
      "postgis": true
    }
  ]
}
```

### Configuration


```json
"postgresql": {
  "conf": {
    "data_directory": "/dev/null",
    // ... all options explicitly set here
  }
}
```

You may also set the contents of `pg_hba.conf` via attributes:

```json
"postgresql": {
  "pg_hba": [
    { "type": "local", "db": "all", "user": "postgres",   "addr": "",             "method": "ident" },
    { "type": "local", "db": "all", "user": "all",        "addr": "",             "method": "trust" },
    { "type": "host",  "db": "all", "user": "all",        "addr": "127.0.0.1/32", "method": "trust" },
    { "type": "host",  "db": "all", "user": "all",        "addr": "::1/128",      "method": "trust" },
    { "type": "host",  "db": "all", "user": "postgres",   "addr": "127.0.0.1/32", "method": "trust" },
    { "type": "host",  "db": "all", "user": "username",   "addr": "127.0.0.1/32", "method": "trust" }
  ]
}
```

## Attributes

Too many to list so refer to [attributes.rb](https://github.com/ChowOps/chef-postgresql/blob/master/attributes/default.rb)

## License

Refer to [LICENSE](https://github.com/ChowOps/chef-postgresql/blob/master/LICENSE)
