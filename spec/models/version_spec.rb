require 'spec_helper'

describe Version do
  subject { Fabricate :version }

  context 'validations' do
    it { should validate_uniqueness_of(:name).scoped_to(:pipegem_id) }
    it { should validate_presence_of :name }
  end

  context 'default values' do
    it 'published default value is false' do
      subject.published.should be_false
    end
  end

end
