%w{rubygems sinatra haml}.each { |lib| require lib }

class PublicIp < Sinatra::Base

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
end
