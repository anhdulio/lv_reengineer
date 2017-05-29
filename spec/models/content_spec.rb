require 'rails_helper'

RSpec.describe About, type: :model do
  it 'has a valid factory' do
    about = build(:about)
    expect(about).to be_valid
  end
end

RSpec.describe Blog, type: :model do
  it 'has a valid factory' do
    blog = build(:blog)
    expect(blog).to be_valid
  end
end
