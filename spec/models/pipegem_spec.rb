require 'spec_helper'

describe Pipegem do
  subject { Fabricate :pipegem }

  context 'associations' do
    it { should have_many(:versions).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_presence_of :name }
  end

  context 'validation callbacks' do
    let(:pipegem) { Fabricate.build :pipegem }

    context 'before' do
      it { should strip_attributes :name }
      it 'should use #name_delete_prefix' do
        pipegem.name = 'pipe-pipegem'
        pipegem.valid?
        pipegem.name.should eql 'pipegem'
      end
    end
  end

  context '#name_delete_prefix' do
    it 'should delete `pipe-`' do
      subject.name = 'pipe-pipegem'
      subject.name_delete_prefix
      subject.name.should eql 'pipegem'
    end

    it 'should be case insensitive' do
      subject.name = 'PiPe-pipegem'
      subject.name_delete_prefix
      subject.name.should eql 'pipegem'
    end
  end

end
