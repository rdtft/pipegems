require 'spec_helper'

describe RubygemsController do
  describe 'routing' do
    it 'routes to #index' do
      get('/').should route_to(
        :controller => 'rubygems',
        :action     => 'index')
    end

    it 'routes to #new' do
      get('/rubygems/new').should route_to(
        :controller => 'rubygems',
        :action     => 'new')
    end

    it 'routes to #show' do
      get('/rubygems/42').should route_to(
        :controller => 'rubygems',
        :action     => 'show',
        :id         => '42')
    end

    it 'routes to #edit' do
      get('/rubygems/42/edit').should route_to(
        :controller => 'rubygems',
        :action     => 'edit',
        :id         => '42')
    end

    it 'routes to #create' do
      post('/rubygems').should route_to(
        :controller => 'rubygems',
        :action     => 'create')
    end

    it 'routes to #update' do
      put('/rubygems/42').should route_to(
        :controller => 'rubygems',
        :action     => 'update',
        :id         => '42')
    end

    it 'routes to #destroy' do
      delete('/rubygems/42').should route_to(
        :controller => 'rubygems',
        :action     => 'destroy',
        :id         => '42')
    end
  end
end
