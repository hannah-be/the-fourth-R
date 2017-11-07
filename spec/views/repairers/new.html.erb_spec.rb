require 'rails_helper'

RSpec.describe "repairers/new", type: :view do
  before(:each) do
    assign(:repairer, Repairer.new(
      :user => nil,
      :address => nil,
      :category => "MyString",
      :description => "MyText",
      :will_travel => false,
      :photo_data => "MyText"
    ))
  end

  it "renders new repairer form" do
    render

    assert_select "form[action=?][method=?]", repairers_path, "post" do

      assert_select "input[name=?]", "repairer[user_id]"

      assert_select "input[name=?]", "repairer[address_id]"

      assert_select "input[name=?]", "repairer[category]"

      assert_select "textarea[name=?]", "repairer[description]"

      assert_select "input[name=?]", "repairer[will_travel]"

      assert_select "textarea[name=?]", "repairer[photo_data]"
    end
  end
end
