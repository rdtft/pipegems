require 'spec_helper'

describe GemsController do
  let(:rubygem_version)  { Fabricate(:rubygem_version) }
  let(:rubygem)          { rubygem_version.rubygem }
  let(:gem_file)         { stub(:id => "pipe-#{rubygem.name}-#{rubygem_version.version}.gem") }

  xit 'should get index' do
    get :index
    response.should be_success
  end

  it 'should show gem file' do
    get :show, :id => gem_file.id
    response.should be_redirect
  end
end
