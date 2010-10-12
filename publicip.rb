%w{rubygems sinatra haml}.each { |lib| require lib }

configure do
  set :root,     Proc.new { File.expand_path(File.dirname(__FILE__)) }
  set :app_file, Proc.new { File.join(root, __FILE__) }
  set :views,    Proc.new { File.join(root, 'views') }
  set :public,   Proc.new { File.join(root, 'public') }
  set :run,      false
  enable :sessions
end

before do
  content_type 'text/html', :charset => 'utf-8'
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/#{params[:name]}"
end

get '/' do
  raw = @request.env["REMOTE_ADDR"]
  raw.match(/^(\d+\.\d+\.\d+\.\d+),?/)
  @ip    = $1
  @title = "Your ip is"
  haml :index
end
