#
# Cookbook Name:: postgresql
# Attributes:: default
#
# Author:: Phil Cohen <github@phlippers.net>
#
# Copyright 2012-2013, Phil Cohen
#

default["postgresql"]["version"]                         = "9.6"

#----------------------------------------------------------------------------
# DAEMON CONTROL
#----------------------------------------------------------------------------

default["postgresql"]["service_actions"]                 = %w[enable start]
default["postgresql"]["cfg_update_action"]               = :restart

#------------------------------------------------------------------------------
# APT REPOSITORY
#------------------------------------------------------------------------------

default["postgresql"]["apt_distribution"]                = node["lsb"]["codename"]
default["postgresql"]["apt_repository"]                  = "apt.postgresql.org"
default["postgresql"]["apt_uri"]                         = "http://apt.postgresql.org/pub/repos/apt"
default["postgresql"]["apt_components"]                  = ["main", node["postgresql"]["version"]]
default["postgresql"]["apt_key"]                         = "https://www.postgresql.org/media/keys/ACCC4CF8.asc"

default["postgresql"]["environment_variables"]           = {}
default["postgresql"]["pg_ctl_options"]                  = ""
default["postgresql"]["pg_hba"]                          = []
default["postgresql"]["pg_hba_defaults"]                 = true
default["postgresql"]["pg_ident"]                        = []
default["postgresql"]["start"]                           = "auto" # auto, manual, disabled

default["postgresql"]["initdb_options"]                  = "--locale=en_US.UTF-8"

#------------------------------------------------------------------------------
# FILE LOCATIONS
#------------------------------------------------------------------------------
default["postgresql"]["data_directory"]                  = "/var/lib/postgresql/#{node["postgresql"]["version"]}/main"
default["postgresql"]["hba_file"]                        = "/etc/postgresql/#{node["postgresql"]["version"]}/main/pg_hba.conf"
default["postgresql"]["ident_file"]                      = "/etc/postgresql/#{node["postgresql"]["version"]}/main/pg_ident.conf"
default["postgresql"]["external_pid_file"]               = "/var/run/postgresql/#{node["postgresql"]["version"]}-main.pid"

#------------------------------------------------------------------------------
# CONNECTIONS AND AUTHENTICATION
#------------------------------------------------------------------------------

# Connection settings
default["postgresql"]["listen_addresses"]                = "localhost"
default["postgresql"]["port"]                            = 5432
default["postgresql"]["max_connections"]                 = 100

# security and authentication
default["postgresql"]["ssl"]                             = true
default["postgresql"]["ssl_ciphers"]                     = "ALL:!ADH:!LOW:!EXP:!MD5:@STRENGTH"
default["postgresql"]["ssl_renegotiation_limit"]         = "512MB"
default["postgresql"]["ssl_ca_file"]                     = ""
default["postgresql"]["ssl_cert_file"]                   = "/etc/ssl/certs/ssl-cert-snakeoil.pem"
default["postgresql"]["ssl_crl_file"]                    = ""
default["postgresql"]["ssl_key_file"]                    = "/etc/ssl/private/ssl-cert-snakeoil.key"
default["postgresql"]["password_encryption"]             = "on"
default["postgresql"]["db_user_namespace"]               = "off"

# PgTune settings
default["postgresql"]["shared_buffers"]                  = "128MB"
default["postgresql"]["work_mem"]                        = "655kB"
default["postgresql"]["maintenance_work_mem"]            = "32MB"
default["postgresql"]["effective_cache_size"]            = "384MB"
default["postgresql"]["min_wal_size"]                    = "1GB"
default["postgresql"]["max_wal_size"]                    = "2GB"
default["postgresql"]["wal_buffers"]                     = "3932kB"
default["postgresql"]["checkpoint_completion_target"]    = 0.7
default["postgresql"]["default_statistics_target"]       = 100

#------------------------------------------------------------------------------
# ERROR REPORTING AND LOGGING
#------------------------------------------------------------------------------

# These are relevant when logging to syslog:
default["postgresql"]["syslog_facility"]                 = "LOCAL0"
default["postgresql"]["syslog_ident"]                    = "postgres"

#------------------------------------------------------------------------------
# USERS AND DATABASES
#------------------------------------------------------------------------------

default["postgresql"]["users"]                           = []
default["postgresql"]["databases"]                       = []
default["postgresql"]["extensions"]                      = []
