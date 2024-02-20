class Shelter < ApplicationRecord
   validates :name, presence: true

   belongs_to :user
   has_many :animals
end
