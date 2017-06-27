require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :vi => "Vi",
        :en => "En",
        :content => "Content"
      ),
      Category.create!(
        :vi => "Vi",
        :en => "En",
        :content => "Content"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Vi".to_s, :count => 2
    assert_select "tr>td", :text => "En".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
