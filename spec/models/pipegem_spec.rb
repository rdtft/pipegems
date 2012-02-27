require 'spec_helper'

describe Pipegem do
  subject { Fabricate :pipegem }

  context 'validations' do
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :name }
  end

  context '#normalize_name' do
    let(:pipegem) { Fabricate.build :pipegem }

    it 'strip whitespaces' do
      name = 'pipe-awesome'
      bad_name = name.center(20)
      pipegem.name = bad_name
      pipegem.normalize_name
      pipegem.name.should eql name
    end

    it 'add prefix `pipe-` if without prefix' do
      pipegem.name = 'awesome'
      pipegem.normalize_name
      pipegem.name.should eql 'pipe-awesome'
    end

    it 'don`t add prefix `pipe-` if with prefix' do
      name = 'pipe-awesome'
      pipegem.name = name
      pipegem.normalize_name
      pipegem.name.should eql name
    end

    it 'delete prefix `pipe-` if with prefix only' do
      pipegem.name = 'pipe-'
      pipegem.normalize_name
      pipegem.name.should eql ''
    end

  end
end
