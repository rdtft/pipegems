require 'spec_helper'
require 'cancan/matchers'

describe "Ability" do
  describe "as guest" do
    before(:each) do
      @ability = Ability.new(nil)
    end

    it "can view rubygems" do
      @ability.should be_able_to(:show, :rubygems)
      @ability.should be_able_to(:index, :rubygems)
      @ability.should_not be_able_to(:update, :rubygems)
      @ability.should_not be_able_to(:destroy, :rubygems)
    end

    it "can view rubygem versions" do
      @ability.should be_able_to(:show, :rubygem_versions)
      @ability.should be_able_to(:index, :rubygem_versions)
      @ability.should_not be_able_to(:update, :rubygem_versions)
      @ability.should_not be_able_to(:destroy, :rubygem_versions)
    end

    it "cannot create rubygems and rubygem versions" do
      @ability.should_not be_able_to(:create, :rubygems)
      @ability.should_not be_able_to(:create, :rubygem_versions)
    end
  end

  describe "as a registered user" do
    before(:each) do
      @user = Fabricate(:user)
      @ability = Ability.new(@user)
    end

    it "can create rubygems and rubygem versions" do
      @ability.should be_able_to(:create, :rubygems)
      @ability.should be_able_to(:create, :rubygem_versions)
    end

    it "cannot create a rubygem version instead of another user" do
      @rubygem = Fabricate(:rubygem)
      @ability.should be_able_to(:create, @rubygem)
    end
  end
end
