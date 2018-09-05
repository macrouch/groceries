require 'rails_helper'

describe User do
  it { should have_one :owned_list }
  it { should have_many :list_members }
  it { should have_many(:lists).through(:list_members) }
end
