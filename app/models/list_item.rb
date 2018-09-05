class ListItem < ApplicationRecord
  belongs_to :list
  belongs_to :item

  validates :list_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true
  validates :need, presence: true
end
