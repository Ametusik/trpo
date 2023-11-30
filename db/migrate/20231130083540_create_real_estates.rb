class CreateRealEstates < ActiveRecord::Migration[7.1]
  def change
    create_table :real_estates do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
