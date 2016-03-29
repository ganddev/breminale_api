require 'rails_helper'

RSpec.describe "breminale_dates/new", type: :view do
  before(:each) do
    assign(:breminale_date, BreminaleDate.new())
  end

  it "renders new breminale_date form" do
    render

    assert_select "form[action=?][method=?]", breminale_dates_path, "post" do
    end
  end
end
