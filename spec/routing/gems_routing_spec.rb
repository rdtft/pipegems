require 'spec_helper'

describe GemsController do
  describe 'routing' do
    it 'routing to #index' do
      get('/gems').should route_to(
        :controller => 'gems',
        :action     => 'index')
    end

    it 'routing to #show' do
      get('/gems/pipe-0.1.0-quux.gem').should route_to(
        :controller => 'gems',
        :action     => 'show',
        :id         => 'pipe-0.1.0-quux.gem')
    end
  end
end
