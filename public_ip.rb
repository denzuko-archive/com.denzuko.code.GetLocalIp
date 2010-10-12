%w{rubygems sinatra haml}.each { |lib| require lib }

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/#{params[:name]}"
end

get '/' do
  raw = @request.env["REMOTE_ADDR"]
  raw.match(/^(\d+\.\d+\.\d+),?/)
  @ip = $1

  content_type 'text/html', :charset => 'utf-8'
  haml :index
end

__END__
@@ stylesheets/site.css

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
