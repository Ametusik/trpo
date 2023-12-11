class AddValidationFieldToRealEstate < ActiveRecord::Migration[7.1]
  def change
    add_column :real_estates, :validated, :boolean
  end
end
