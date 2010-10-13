%w{rubygems compass sinatra haml}.each { |lib| require lib }
require 'bundler/setup'
require 'rack/cache'
require 'application'

use Rack::Cache,
  :verbose     => true,
  :metastore   => 'heap:/',
  :entitystore => 'heap:/'

run Sinatra::Application
