%w(rubygems compass sinatra).each { |lib| require lib }
require 'bundler/setup'
require 'rack/cache'
require 'haml/more'

require 'application'

use Rack::Cache,
  :verbose     => true,
  :metastore   => 'heap:/',
  :entitystore => 'heap:/'

run MyApp
