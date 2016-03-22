require 'rails_helper'

RSpec.describe "breminale_dates/edit", type: :view do
  before(:each) do
    @breminale_date = assign(:breminale_date, BreminaleDate.create!())
  end

  it "renders the edit breminale_date form" do
    render

    assert_select "form[action=?][method=?]", breminale_date_path(@breminale_date), "post" do
    end
  end
end
