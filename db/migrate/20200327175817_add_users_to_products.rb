class AddUsersToProducts < ActiveRecord::Migration[5.2]

  # For rake:db migrate to add user index to products
  def up
    add_reference :products, :user, index: true
    Product.reset_column_information
    user = User.first

    Product.all.each do |product|
      product.user_id = user.id
      product.save!
    end

    change_column_null :products, :user_id, false
    add_foreign_key :products, :users
  end

  # For rake db:rollback to remove index from products
  def down
    remove_foreign_key :products, :users
    remove_reference :products, :user, index: true
  end

end
