class RenameColumnBillsUserIdToBillsAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :bills, :user_id, :author_id
  end
end
