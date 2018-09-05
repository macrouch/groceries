require 'rails_helper'

describe ListMember do
  it { should belong_to :list }
  it { should belong_to :user }
  it { should validate_presence_of :list_id }
  it { should validate_presence_of :user_id }
end
