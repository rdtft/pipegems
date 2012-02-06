require 'spec_helper'

describe Rubygem do
  before(:each) do
    @attr = {
      name: 'foo',
      user: Fabricate(:user)
    }
  end

  it 'should create a new valid instance' do
    rubygem = Rubygem.new(@attr)
    rubygem.should be_valid
  end

  it 'should require name' do
    rubygem = Rubygem.new(@attr.merge(name: ''))
    rubygem.should_not be_valid
  end

  it 'should reject duplicate name' do
    Rubygem.create!(@attr)
    rubygem = Rubygem.new(@attr)
    rubygem.should_not be_valid
  end
end
