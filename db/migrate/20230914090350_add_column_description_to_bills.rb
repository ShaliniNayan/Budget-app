class AddColumnDescriptionToBills < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :description, :string
  end
end
