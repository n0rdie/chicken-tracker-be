require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:species) }
  end

  describe 'associations' do
    it { should belong_to(:shelter) }
    it { should have_one_attached(:image) }
  end
end