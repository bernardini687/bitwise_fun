# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}" }

# ruby '2.6.3'

gem 'sinatra', '~> 2.2', require: 'sinatra/base'

# automatic rack reloader
gem 'sinatra-contrib', '~> 2.2', require: 'sinatra/reloader'

group :test do
  gem 'rack-test', '~> 1.1'
  gem 'rspec',     '~> 3.8'
end
