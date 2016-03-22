require 'rails_helper'

RSpec.describe "BreminaleDates", type: :request do
  describe "GET /breminale_dates" do
    it "works! (now write some real specs)" do
      get breminale_dates_path
      expect(response).to have_http_status(200)
    end
  end
end
