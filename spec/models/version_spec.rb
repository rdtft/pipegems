require 'spec_helper'

describe Version do
  subject { Fabricate :version }

  context 'validations' do
    it { should validate_uniqueness_of(:name).scoped_to(:pipegem_id) }
    it { should validate_presence_of :name }

    context 'format' do
      it { should allow_value('v0.1.24a').for(:name) }
      it { should_not allow_value('q.1.10.2b.').for(:name) }
    end
  end

  context 'validation callbacks' do
    let(:version) { Fabricate.build :version }
  
    context 'before' do
      it '#name_strip_whitespaces' do
        version.name = 'v0.1.0'.center(20)
        version.valid?
        version.name.should eql 'v0.1.0'
      end
    end
    
    context 'after' do
      it '#normalize_prefix' do
        version.name = '0.1.0'
        version.valid?
        version.name.should eql 'v0.1.0'
      end
    end
  end

  context 'default values' do
    it 'published default value is false' do
      subject.published.should be_false
    end
  end

  it '#name_strip_whitespaces' do
    name = '0.1.0'
    bad_name = name.center(20)
    subject.name = bad_name
    subject.name_strip_whitespaces
    subject.name.should eql name
  end
  
  context '#name_normalize_prefix' do
    it 'add prefix `v` if without prefix' do
      subject.name = '0.1.0'
      subject.name_normalize_prefix
      subject.name.should eql 'v0.1.0'
    end
    
    it 'don`t add prefix `v` if with prefix' do
      name = 'v0.1.0'
      subject.name = name
      subject.name_normalize_prefix
      subject.name.should eql name
    end
  end
  
end
