source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'pg'

gem 'devise'
gem 'omniauth'

gem 'carrierwave'
gem 'fog'

gem 'inherited_resources'

gem 'cancan', git: 'git://github.com/ryanb/cancan.git', branch: '2.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'capistrano'
end

group :production do
  gem 'unicorn'
  gem 'therubyracer'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
