require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      title: "Title",
      sold: false,
      category: nil,
      user: nil,
      description: nil,
      price: 2,
      colour: "Colour",
      condition: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Colour/)
    expect(rendered).to match(/3/)
  end
end
