class CreateUserWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_wishlists do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
