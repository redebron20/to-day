ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require 'dotenv/load'

configure :development do
  set :database, "sqlite3:db/#{ENV['SINATRA_ENV']}.sqlite"
end

require_all 'app'
