class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name null: false
      t.decimal :price deafault:0 
      t.text :description null: false
      t.image: image null: false

      t.timestamps
    end
  end
end
