require 'spec_helper'

describe RubygemVersionsController do
  describe 'routing' do
    it 'routes to #index' do
      get('/rubygems/42/rubygem_versions').should route_to(
        :controller => 'rubygem_versions',
        :action     => 'index',
        :rubygem_id => '42')
    end

    it 'routes to #new' do
      get('/rubygems/42/rubygem_versions/new').should route_to(
        :controller => 'rubygem_versions',
        :action     => 'new',
        :rubygem_id => '42')
    end

    it 'routes to #show' do
      get('/rubygems/17/rubygem_versions/42').should route_to(
        :controller => 'rubygem_versions',
        :action     => 'show',
        :rubygem_id => '17',
        :id         => '42')
    end

    it 'routes to #edit' do
      get('/rubygems/17/rubygem_versions/42/edit').should route_to(
        :controller => 'rubygem_versions',
        :action     => 'edit',
        :rubygem_id => '17',
        :id         => '42')
    end

    it 'routes to #create' do
      post('/rubygems/17/rubygem_versions').should route_to(
        :controller => 'rubygem_versions',
        :action     => 'create',
        :rubygem_id => '17')
    end

    it 'routes to #update' do
      put('/rubygems/17/rubygem_versions/42').should route_to(
        :controller => 'rubygem_versions',
        :action     => 'update',
        :rubygem_id => '17',
        :id         => '42')
    end

    it 'routes to #destroy' do
      delete('/rubygems/17/rubygem_versions/42').should route_to(
        :controller => 'rubygem_versions',
        :action     => 'destroy',
        :rubygem_id => '17',
        :id         => '42')
    end
  end
end
