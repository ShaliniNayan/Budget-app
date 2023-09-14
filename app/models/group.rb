class Group < ApplicationRecord
  mount_uploader :icon, IconUploader
  has_many :bills, dependent: :destroy
  belongs_to :user
end
