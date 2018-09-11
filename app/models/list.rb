class List < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :list_members
  has_many :members, through: :list_members, source: :user
  has_many :list_items
  has_many :items, through: :list_items, source: :item

  validates :name, presence: true
  validates :owner_id, presence: true

  def needed_items
    list_items.where(need: true).sort_by { |item| item.name.downcase }
  end
end
