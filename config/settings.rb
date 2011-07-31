#Database connection URL.
#Expected format:
# <adapter>://<username>:<password>@<host>:<port>/<database_name>
#URL format examples:
# postgres://<username>:<password>@<host>:<port>/<database_name>
# mysql://<username>:<password>@<host>:<port>/<database_name>
# sqlite://<filename>
#
#For more configuration options read: http://screencasts.org/episodes/configuring-activerecord-in-sinatra

database_urls = {
  :development => 'postgresql://candlepin:candlepin@localhost/candlepin',
  :production  => 'postgresql://candlepin:candlepin@localhost/candlepin',
  :test        => 'sqlite://mini-search-test.db'
}

set :database, database_urls[settings.environment]

