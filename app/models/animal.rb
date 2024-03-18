class Animal < ApplicationRecord
   validates :name, presence: true
   validates :species, presence: true
   
   belongs_to :shelter

   has_one_attached :image
end
