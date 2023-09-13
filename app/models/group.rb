class Group < ApplicationRecord
  mount_uploader :icon, IconUploader
  has_many :bills
  belongs_to :user
end
