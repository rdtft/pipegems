require 'spec_helper'

describe Version do
  subject { Fabricate :version }

  context 'validations' do
    it { should validate_uniqueness_of(:name).scoped_to(:pipegem_id) }
    it { should validate_presence_of :name }

    context 'format' do
      it { should allow_value('v0.1.24a').for(:name) }
      it { should_not allow_value('q0.1.24a').for(:name) }
    end
  end

  context 'validation callbacks' do
    let(:version) { Fabricate.build :version }

    context 'before' do
      it { should strip_attributes :name }
      it 'should use #name_delete_prefix' do
        version.name = 'v0.1.0'
        version.valid?
        version.name.should eql '0.1.0'
      end
    end
  end

  context '#name_delete_prefix' do
    it 'should delete `v-`' do
      subject.name = 'v0.1.0'
      subject.name_delete_prefix
      subject.name.should eql '0.1.0'
    end
    
    it 'should be case insensitive' do
      subject.name = 'V0.1.0'
      subject.name_delete_prefix
      subject.name.should eql '0.1.0'
    end
  end

  context 'default values' do
    it 'published should be false' do
      subject.published.should be_false
    end
  end

end
