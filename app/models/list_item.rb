class ListItem < ApplicationRecord
  belongs_to :list
  belongs_to :item

  validates :list_id, presence: true
  validates :item_id, presence: true
  validates_inclusion_of :need, in: [true, false]
  delegate :name, to: :item

  def as_json(_options)
    { id: id, name: name, quantity: quantity || '' }
  end
end
