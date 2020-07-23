# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'activerecord', require: 'active_record'
gem 'rake'
gem 'sqlite3'
gem 'pry-rails' 
gem 'shotgun'
gem 'require_all'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'bcrypt'
gem 'rack-flash3', require: 'rack-flash'
gem 'pony'
gem 'jwt'
gem 'json'

group :production do
  # Use Postgresql for ActiveRecord

end

group :development, :test do
  # Use SQLite for ActiveRecord
end
