require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :user => nil,
      :name => "MyString",
      :phone => "MyString",
      :profile-photo-data => "MyText",
      :address => nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[name]"

      assert_select "input[name=?]", "profile[phone]"

      assert_select "textarea[name=?]", "profile[profile-photo-data]"

      assert_select "input[name=?]", "profile[address_id]"
    end
  end
end
