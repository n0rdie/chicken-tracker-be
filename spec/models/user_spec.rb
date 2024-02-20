require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:password_digest) }
  end

  describe 'associations' do
    it { should have_many(:shelters) }
    it { should have_many(:animals).through(:shelters) }
  end
end
