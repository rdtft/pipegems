source 'http://rubygems.org'

gem 'rails',               '~> 3.2.1'

gem 'pg',                  '~> 0.12.2'

gem 'devise',              '~> 2.0.0'
gem 'omniauth-github',     '~> 1.0.1'

gem 'carrierwave', git: 'git://github.com/jnicklas/carrierwave.git'

gem 'inherited_resources', '~> 1.3.0'

gem 'cancan', git: 'git://github.com/ryanb/cancan.git', branch: '2.0'

gem 'jquery-rails',        '~> 2.0.0'
gem 'ember-rails',         '~> 0.2.4'

group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier',     '~> 1.2.3'
end

group :development, :test do
  gem 'fabrication', '~> 1.2.0'
  gem 'rspec-rails', '~> 2.8.1'
  gem 'guard-rspec', '~> 0.6.0'
  gem 'shoulda',     git: 'git://github.com/mkaschenko/shoulda.git', branch: 'fix_primary_key_name'
end

group :development do
  gem 'capistrano',   '~> 2.9.0'
  gem 'ruby-debug19', '~> 0.11.6', platform: :ruby_19
end

group :test do
  gem 'database_cleaner', '~> 0.7.1'
  gem 'spork',            '~> 1.0rc'
end

group :production do
  gem 'unicorn',      '~> 4.2.0'
  gem 'therubyracer', '~> 0.9.9'
end
