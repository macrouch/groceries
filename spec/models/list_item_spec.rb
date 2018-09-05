require 'rails_helper'

describe ListItem do
  it { should belong_to :list }
  it { should belong_to :item }
  it { should validate_presence_of :list_id }
  it { should validate_presence_of :item_id }
  it { should validate_presence_of :quantity }
  it { should validate_presence_of :need }
end
