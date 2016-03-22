require 'rails_helper'

RSpec.describe "breminale_dates/index", type: :view do
  before(:each) do
    assign(:breminale_dates, [
      BreminaleDate.create!(),
      BreminaleDate.create!()
    ])
  end

  it "renders a list of breminale_dates" do
    render
  end
end
