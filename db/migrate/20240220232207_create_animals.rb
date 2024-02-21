class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :birthday
      t.string :color
      t.string :slogan
      t.string :diet
      t.string :speed

      t.references :shelter, foreign_key: true

      t.timestamps
    end
  end
end
