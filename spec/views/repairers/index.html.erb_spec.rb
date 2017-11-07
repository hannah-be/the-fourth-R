require 'rails_helper'

RSpec.describe "repairers/index", type: :view do
  before(:each) do
    assign(:repairers, [
      Repairer.create!(
        :user => nil,
        :address => nil,
        :category => "Category",
        :description => "MyText",
        :will_travel => false,
        :photo_data => "MyText"
      ),
      Repairer.create!(
        :user => nil,
        :address => nil,
        :category => "Category",
        :description => "MyText",
        :will_travel => false,
        :photo_data => "MyText"
      )
    ])
  end

  it "renders a list of repairers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
