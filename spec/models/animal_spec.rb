require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:type) }
  end

  describe 'associations' do
    it { should belong_to(:shelter) }
  end
end