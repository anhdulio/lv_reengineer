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

RSpec.describe Content, type: :model do
  it 'has a valid factory' do
    content = build(:content)
    expect(content).to be_valid
  end

  it 'has a unique slug' do
    slug = 'dup-slug'
    create(:content, slug: slug)
    content2 = build(:content, slug: slug)
    expect(content2.save).to be_falsey
  end
end

