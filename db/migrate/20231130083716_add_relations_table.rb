class AddRelationsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :users_real_estates, id: false do |t|
      t.belongs_to :user
      t.belongs_to :real_estate
    end
  end
end
