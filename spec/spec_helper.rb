ENV["RAILS_ENV"] ||= 'test'

begin
  require 'rubygems'
  require 'spork'
rescue LoadError => e
end

def load_all(*patterns)
  patterns.each { |pattern| Dir[pattern].sort.each { |path| load File.expand_path(path) } }
end

def require_all(*patterns)
  options = patterns.pop
  patterns.each { |pattern| Dir[pattern].sort.each { |path| require path.gsub(/^#{options[:relative_to]}\//, '') } }
end

def configure
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'database_cleaner'
  require_all 'spec/support/**/*.rb', :relative_to => 'spec'

  RSpec.configure do |c|
    c.mock_with :rspec

    c.before :suite do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with :truncation
    end

    c.before :each do
      DatabaseCleaner.start
    end

    c.after :each do
      DatabaseCleaner.clean
    end
  end
end

if defined?(Spork)
  Spork.prefork  { configure }
  Spork.each_run { load_all 'lib/**/*.rb', '/config/routes.rb' }
else
  configure
end
