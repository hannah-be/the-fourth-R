require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :title => "MyString",
      :category => "MyString",
      :description => "MyText",
      :problem => "MyText",
      :item_photo_data => "MyText"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[title]"

      assert_select "input[name=?]", "item[category]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "textarea[name=?]", "item[problem]"

      assert_select "textarea[name=?]", "item[item_photo_data]"
    end
  end
end
