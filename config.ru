require 'public_ip'

set :root,     File.expand_path(File.dirname(__FILE__))
set :app_file, File.join(:root.to_s, __FILE__)
set :views,    File.join(:root.to_s, 'views')
set :public,   File.join(:root.to_s, 'public')

run PublicIP
