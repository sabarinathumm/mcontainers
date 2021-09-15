source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.7'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Use active_model_serializers for generate custom json for api
gem 'active_model_serializers', '~> 0.10.0'

# Use kaminari and api-pagination for data pagination
gem 'kaminari'
gem 'api-pagination'

# Use faker and factory_bot_rails used for create dummy data in specified environment
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
gem 'factory_bot_rails', '~> 4.0'

gem 'devise'
gem 'doorkeeper'

gem 'money-rails', '~>1.12'

gem 'carrierwave', '~> 2.0'
gem "roo", "~> 2.8.0"

gem 'dotenv-rails'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'rspec_api_documentation'
  gem 'reqres_rspec'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem "binding_of_caller"
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
