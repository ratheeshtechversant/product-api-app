class ChangetableCartItem < ActiveRecord::Migration[7.0]
  def change
    change_column :cart_items, :quantity, :decimal
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
