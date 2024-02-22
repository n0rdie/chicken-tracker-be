class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :birthday
      t.string :color
      t.string :main_prey
      t.string :habitat
      t.string :diet
      t.string :skin_type
      t.string :top_speed
      t.string :avg_litter
      t.string :lifespan
      t.string :weight
      t.string :lifestyle
      t.string :fav_food

      t.references :shelter, foreign_key: true

      t.timestamps
    end
  end
end