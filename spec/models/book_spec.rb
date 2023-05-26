require 'rails_helper'

RSpec.describe Book, type: :model do
it {should_belong_to(:category)}
it {should_validate_presence_of(:title)}
it {should_validate_presence_of(:author)}
it {should_validate_length_of(:author).is_at_least(3).is_at_most(100)}
it {should_validate_lenght_of(:title).is_at_least(3).is_at_most(100)}
end
