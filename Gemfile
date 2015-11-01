source 'https://rubygems.org'
ruby '2.2.1'


# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

# PostgreSQL driver
gem 'pg'

gem 'activesupport'
gem 'activerecord'

# Use Thin for our web server
gem 'thin'

gem 'httparty'

gem 'rake'

gem 'shotgun'

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec', '~>3.0'
  gem 'capybara'
end

group :test, :development do
  gem 'factory_girl'
  gem 'faker'
end
