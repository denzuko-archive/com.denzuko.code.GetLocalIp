require 'public_ip'

set :root,     File.expand_path File.dirname(__FILE__)
set :app_file, File.join :root, __FILE__
set :views,    File.join :root, 'views'
set :public,   File.join :root, 'public'

run PublicIP
