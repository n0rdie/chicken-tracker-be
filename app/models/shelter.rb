class Shelter < ApplicationRecord
   validates :name, presence: true

   has_many :animals
end
