require 'rails_helper'

RSpec.describe "breminale_dates/show", type: :view do
  before(:each) do
    @breminale_date = assign(:breminale_date, BreminaleDate.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
