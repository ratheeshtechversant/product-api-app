class CreateUserInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_informations do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :mobile
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
