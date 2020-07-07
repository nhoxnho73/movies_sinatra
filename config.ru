require_relative 'config/environment.rb'
require 'pony'
require 'sinatra/base'

use Rack::MethodOverride
use UsersController
use GenresController
use MoviesController
run ApplicationController

class Application < Sinatra::Base
  configure do
    Pony.options = {
      :via => :smtp,
      :via_options => {
        :address => 'smtp.mailtrap.io',
        :port => '2525',
        :domain => 'smtp.mailtrap.io',
        :user_name => 'a965d11170b075',
        :password => '36d83de63284f5',
        :authentication => :cram_md5,
        :enable_starttls_auto => true
      }
    }
  end

end
