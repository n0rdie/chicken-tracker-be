class Animal < ApplicationRecord
   validates :name, presence: true
   validates :species, presence: true
   
   belongs_to :shelter
end
