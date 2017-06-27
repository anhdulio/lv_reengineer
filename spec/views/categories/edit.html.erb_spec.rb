require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :vi => "MyString",
      :en => "MyString",
      :content => "MyString"
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_vi[name=?]", "category[vi]"

      assert_select "input#category_en[name=?]", "category[en]"

      assert_select "input#category_content[name=?]", "category[content]"
    end
  end
end
