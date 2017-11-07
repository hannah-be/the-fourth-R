require 'rails_helper'

RSpec.describe "repairers/show", type: :view do
  before(:each) do
    @repairer = assign(:repairer, Repairer.create!(
      :user => nil,
      :address => nil,
      :category => "Category",
      :description => "MyText",
      :will_travel => false,
      :photo_data => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
