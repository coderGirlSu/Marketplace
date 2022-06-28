require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      title: "MyString",
      sold: false,
      category: nil,
      user: nil,
      description: nil,
      price: 1,
      colour: "MyString",
      condition: 1
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "input[name=?]", "product[sold]"

      assert_select "input[name=?]", "product[category_id]"

      assert_select "input[name=?]", "product[user_id]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[colour]"

      assert_select "input[name=?]", "product[condition]"
    end
  end
end
