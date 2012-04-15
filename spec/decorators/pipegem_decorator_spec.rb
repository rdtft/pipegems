require 'spec_helper'

describe PipegemDecorator do
  before { ApplicationController.new.set_current_view_context }

  subject { PipegemDecorator.new pipegem } 
  let(:pipegem) { Fabricate.build :pipegem }

  context '#name_with_prefix' do
    it 'should add `pipe-`' do
      subject.name_with_prefix.should eql "pipe-#{pipegem.name}" 
    end
  end
end
