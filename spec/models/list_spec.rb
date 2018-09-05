require 'rails_helper'

describe List do
  it { should belong_to :owner }
  it { should have_many :list_members }
  it { should have_many(:members).through(:list_members) }
  it { should have_many :list_items }
  it { should have_many(:items).through(:list_items) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :owner_id }
end
