require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :title => "MyString",
      :category => "MyString",
      :description => "MyText",
      :problem => "MyText",
      :item_photo_data => "MyText"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[title]"

      assert_select "input[name=?]", "item[category]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "textarea[name=?]", "item[problem]"

      assert_select "textarea[name=?]", "item[item_photo_data]"
    end
  end
end
