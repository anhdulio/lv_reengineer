require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :vi => "Vi",
      :en => "En",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Vi/)
    expect(rendered).to match(/En/)
    expect(rendered).to match(/Content/)
  end
end
