require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }
    it { should validate_numericality_of(:user_id) }
  end

  describe 'associations' do
    it { should have_many(:animals) }
  end
end
