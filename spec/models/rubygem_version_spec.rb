require 'spec_helper'

describe RubygemVersion do
  before(:each) do
    @attr = {
      :version => '0.1.0',
      :rubygem => Fabricate(:rubygem)
    }
  end

  it 'should create a new valid instance' do
    version = RubygemVersion.new(@attr)
    version.should be_valid
  end

  it 'should require version number' do
    version = RubygemVersion.new(@attr.merge(:version => ''))
    version.should_not be_valid
  end

  it 'should reject duplicate version number' do
    RubygemVersion.create!(@attr)
    version = RubygemVersion.new(@attr)
    version.should_not be_valid
  end
end
