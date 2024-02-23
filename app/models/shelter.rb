class Shelter < ApplicationRecord
   validates :name, presence: true
   validates :user_id, presence: true, numericality: true
   
   has_many :animals
end
