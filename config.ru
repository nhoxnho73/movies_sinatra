require_relative 'config/environment.rb'
require 'pony'
require 'sinatra/base'
# require File.expand_path '../main.rb', __FILE__

use Rack::MethodOverride
use UsersController
use GenresController
use MoviesController
run ApplicationController


# run Rack::URLMap.new({
#   '/' => Public,
#   '/api' => Api
# })

class Application < Sinatra::Base
  configure do
    Pony.options = {
      :subject => "Some Subject",
      :body => "This is the body.",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'myapp.com',
        :user_name => 'thanhphong7up@gmail.com',
        :password => 'Ph100792@',
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    }
  end
end
