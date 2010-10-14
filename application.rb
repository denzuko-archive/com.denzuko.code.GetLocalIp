class MyApp < Sinatra::Base
  configure do
    set :root,     Proc.new { File.expand_path(File.dirname(__FILE__)) }
    set :app_file, Proc.new { File.join(root, __FILE__) }
    set :views,    Proc.new { File.join(root, 'app','views') }
    set :public,   Proc.new { File.join(root, 'public') }

    disable :run
    enable :sessions

    Compass.configuration do |config|
      config.output_style = :expanded
      config.project_path = Sinatra::Application.root
      config.sass_path    = Proc.new { File.join(Sinatra::Application.views,  'stylesheets') }
      config.css_path     = Proc.new { File.join(Sinatra::Application.public, 'stylesheets') }
      config.images_path  = Proc.new { File.join(Sinatra::Application.public, 'images') }
      config.environment  = Sinatra::Application.environment
      config.http_path    = '/'
      config.http_images_path      = "/images"
      config.http_stylesheets_path = "/stylesheets"
      config.relative_assets       = true
    end
  end

  helpers Haml::More

  before do
    raw = @request.env["REMOTE_ADDR"]
    raw.match(/^(\d+\.\d+\.\d+\.\d+),?/)
    @remoteip ||= $1

    cache_control :public, :max_age => 2 * 60
  end

  get '/' do
    redirect '/index'
  end

  get '/:name' do
    content_type :html
    @title = "Your ip is #{@remoteip}"
    haml :"#{params[:name]}", :layout => :'layouts/application'
  end
  
  get '/stylesheets/:name.css' do
    content_type :css
    sass :"stylesheets/#{params[:name]}",
         :sass => Compass.sass_engine_options
  end
  
  get '/javascripts/:name.js' do
    content_type :js
    haml :"javascripts/#{params[:name]}"
  end
end