class GroupBill < ApplicationRecord
  belongs_to :group
  belongs_to :bill
end
