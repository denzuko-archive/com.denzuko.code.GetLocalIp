%w(rubygems compass sinatra).each { |lib| require lib }
require 'bundler/setup'
require 'rack/cache'
require 'haml/more'

require 'application'

run MyApp
