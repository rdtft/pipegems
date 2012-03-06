require 'spec_helper'

describe Pipegem do
  subject { Fabricate :pipegem }

  context 'associations' do
    it { should have_many(:versions).dependent(:destroy) }
  end
  
  context 'validation callbacks' do
    let(:pipegem) { Fabricate.build :pipegem }

    context 'before' do
      it '#normalize_name' do
        pipegem.name = 'awesome'.center(20)
        pipegem.valid?
        pipegem.name.should eql 'pipe-awesome'
      end
    end
  end
  
  context 'validations' do
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :name }
  end

  context '#normalize_name' do
    it 'strip whitespaces' do
      name = 'pipe-awesome'
      bad_name = name.center(20)
      subject.name = bad_name
      subject.normalize_name
      subject.name.should eql name
    end

    it 'add prefix `pipe-` if without prefix' do
      subject.name = 'awesome'
      subject.normalize_name
      subject.name.should eql 'pipe-awesome'
    end

    it 'don`t add prefix `pipe-` if with prefix' do
      name = 'pipe-awesome'
      subject.name = name
      subject.normalize_name
      subject.name.should eql name
    end

    it 'delete prefix `pipe-` if with prefix only' do
      subject.name = 'pipe-'
      subject.normalize_name
      subject.name.should eql ''
    end
  end

end
