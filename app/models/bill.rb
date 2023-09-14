class Bill < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group

  delegate :icon, to: :group, prefix: true

  validates :name, presence: true
  validates :group, presence: true

  def group_icon
    group.icon
  end
end
