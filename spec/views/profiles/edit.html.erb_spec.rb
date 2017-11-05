require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :name => "MyString",
      :phone => "MyString",
      :profile-photo-data => "MyText",
      :address => nil
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[name]"

      assert_select "input[name=?]", "profile[phone]"

      assert_select "textarea[name=?]", "profile[profile-photo-data]"

      assert_select "input[name=?]", "profile[address_id]"
    end
  end
end
