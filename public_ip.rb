%w{rubygems sinatra haml}.each do |lib| require lib; end

set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public, 'public'

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/#{params[:name]}"
end

before
  content_type 'text/html', :charset => 'utf-8'
end

get '/' do
  raw = @request.env["REMOTE_ADDR"]
  raw.match(/^(\d+\.\d+\.\d+),?/)
  @ip = $1
  haml :index
end

__END__
@@ site.css
body
  :background white 
  :color black

@@ index.haml

%p
  = @ip

@@ layout.haml

!!! XML
!!!
%html
  %head
    %title= @title
    %link{:rel=>'stylesheets', :href=>"/stylesheets/site.css", :type=>'text/css', :media=>'screen,projection'}
  %body
    #header
      %h1= @title
    #container
      = yield
    #footer
      %p
        Copyright &copy;2010 CompuTEK Industries, LLC.
