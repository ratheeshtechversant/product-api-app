class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :mobile
      t.string :pincode
      t.text :address
      t.string :locality
      t.string :city
      t.string :landmark
      t.string :alternate_mobile
      t.string :address_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
