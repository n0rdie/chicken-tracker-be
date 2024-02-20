class User < ApplicationRecord
   validates :name, presence: true, uniqueness: true
   validates_presence_of :password_digest

   has_many :shelters
   has_many :animals, through: :shelters
end
