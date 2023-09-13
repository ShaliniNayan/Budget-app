class CreateGroupBills < ActiveRecord::Migration[7.0]
  def change
    create_table :group_bills do |t|
      t.references :group, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true
      t.timestamps
    end
  end
end
