class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :rate
      t.integer :year
      
      t.timestamps null: false
    end
  end
end
