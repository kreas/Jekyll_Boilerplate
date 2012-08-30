require 'rubygems'
require 'sinatra'

#set the location of all of the public files
set :public, Proc.new { File.join(root, "static/_site") }

get '/' do
    File.open('static/_site/index.html')
end

get '/admin' do
    "Hello World"
end

error do
  @error = request.env['sinatra_error'].name
  "Oh shit"
end

#route all url requests to the proper foler inside the _site directory
get '/*' do |path|
    File.open("_site/#{path}/index.html")
end

