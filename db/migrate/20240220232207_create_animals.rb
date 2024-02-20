class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name

      t.references :shelter, foreign_key: true

      t.timestamps
    end
  end
end
