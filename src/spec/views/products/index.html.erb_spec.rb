require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        title: "Title",
        sold: false,
        category: nil,
        user: nil,
        description: nil,
        price: 2,
        colour: "Colour",
        condition: 3
      ),
      Product.create!(
        title: "Title",
        sold: false,
        category: nil,
        user: nil,
        description: nil,
        price: 2,
        colour: "Colour",
        condition: 3
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Colour".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
