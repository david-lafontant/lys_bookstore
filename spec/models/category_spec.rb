require 'rails_helper'

RSpec.describe Category, type: :model do
  it {should_have_many(:books)}
  it {should_validate_presence_of(:name)}
  it {should_validate_length_of(:name).is_at_least(3).is_at_most(60)}
end
