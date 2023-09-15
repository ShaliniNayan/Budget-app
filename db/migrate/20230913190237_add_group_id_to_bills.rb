class AddGroupIdToBills < ActiveRecord::Migration[7.0]
  def change
    add_reference :bills, :group, null: false, foreign_key: true
  end
end
