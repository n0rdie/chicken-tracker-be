class CreateShelters < ActiveRecord::Migration[7.1]
  def change
    create_table :shelters do |t|
      t.string :name

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
