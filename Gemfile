source 'http://rubygems.org'

gem 'rails',               '~> 3.2.1'

gem 'pg',                  '~> 0.12.2'

gem 'devise',              '~> 2.0.0'
gem 'omniauth-github',     '~> 1.0.1'

gem 'carrierwave',         '~> 0.5.8'

gem 'inherited_resources', '~> 1.3.0'

gem 'cancan', git: 'git://github.com/ryanb/cancan.git', branch: '2.0'

gem 'jquery-rails',        '~> 2.0.0'

group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier',     '~> 1.2.3'
end

group :development, :test do
  gem 'fabrication', '~> 1.2.0'
  gem 'rspec-rails', '~> 2.8.1'
end

group :development do
  gem 'capistrano',   '~> 2.9.0'
  gem 'ruby-debug19', '~> 0.11.6', platform: :ruby_19
end

group :test do
  gem 'database_cleaner', '~> 0.7.1'
  gem 'spork',            '~> 0.9.0'
end

group :production do
  gem 'unicorn',      '~> 4.2.0'
  gem 'therubyracer', '~> 0.9.9'
end
