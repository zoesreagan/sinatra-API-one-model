class ApplicationController < Sinatra::Base

  require 'bundler'
  Bundler.require()

  enable :sessions # yep, that's it

  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql', 
    :database => 'item'
  )
  use Rack::MethodOverride  # we "use" middleware in Rack-based libraries/frameworks
  set :method_override, true

  set :public_dir, File.expand_path('../public', File.dirname(__FILE__))
  
  set :views, File.expand_path('../views', File.dirname(__FILE__))

  get '/' do
    @page = "hello"
    erb :hello
  end

end