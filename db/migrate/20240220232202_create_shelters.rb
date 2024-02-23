class CreateShelters < ActiveRecord::Migration[7.1]
  def change
    create_table :shelters do |t|
      t.string :name
      t.integer :user_id
      
      t.timestamps
    end
  end
end
