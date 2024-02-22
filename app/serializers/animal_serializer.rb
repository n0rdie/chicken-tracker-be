class AnimalSerializer
    include JSONAPI::Serializer

    belongs_to :shelter
    
    attributes  :shelter_id, 
                :name, 
                :species, 
                :birthday, 
                :color, 
                :main_prey, 
                :habitat, 
                :diet, 
                :skin_type, 
                :top_speed, 
                :avg_litter, 
                :lifespan, 
                :weight, 
                :lifestyle, 
                :fav_food
end