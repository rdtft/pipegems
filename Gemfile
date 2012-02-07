source 'http://rubygems.org'

gem 'rails', '~> 3.2.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'pg'

gem 'devise'
gem 'omniauth-github'

gem 'carrierwave', git: "git://github.com/jnicklas/carrierwave.git"

gem 'fog'

gem 'inherited_resources'

gem 'cancan', git: 'git://github.com/ryanb/cancan.git', branch: '2.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem 'fabrication'
  gem 'rspec-rails', '~> 2.8.0'
end

group :development do
  gem 'capistrano'
end

group :production do
  gem 'unicorn'
  gem 'therubyracer'
end

group :test do
  gem 'database_cleaner'
  gem 'spork', '~> 1.0rc'
end
