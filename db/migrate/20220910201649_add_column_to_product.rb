class AddColumnToProduct < ActiveRecord::Migration[7.0]
  def change
    # add_column :products, :category_id, :integer, foreign_key: true
    add_reference :products, :category, foreign_key: true

    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
