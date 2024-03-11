class AnimalPoro
  attr_reader :id,
              :shelter_id, 
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

  def initialize(data)
    @name = ''
    @species = data[:name]
    @birthday = ''
    @color = ''
    @main_prey = data[:characteristics][:main_prey]
    @habitat = data[:characteristics][:habitat]
    @diet = data[:characteristics][:diet]
    @skin_type = data[:characteristics][:skin_type]
    @top_speed = data[:characteristics][:top_speed]
    @avg_litter = if data[:characteristics][:average_clutch_size]
    else data[:characteristics][:average_litter_size]
    end
    @lifespan = data[:characteristics][:lifespan]
    @weight = data[:characteristics][:weight]
    @lifestyle = data[:characteristics][:lifestyle]
    @fav_food = data[:characteristics][:favorite_food]
  end
end