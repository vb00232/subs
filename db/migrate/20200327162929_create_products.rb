class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, default:0
      t.text :description, null: false

      t.timestamps
    end
  end
end
