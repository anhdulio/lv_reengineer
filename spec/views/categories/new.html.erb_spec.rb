require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      :vi => "MyString",
      :en => "MyString",
      :content => "MyString"
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_vi[name=?]", "category[vi]"

      assert_select "input#category_en[name=?]", "category[en]"

      assert_select "input#category_content[name=?]", "category[content]"
    end
  end
end
