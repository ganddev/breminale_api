require "rails_helper"

RSpec.describe BreminaleDatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/breminale_dates").to route_to("breminale_dates#index")
    end

    it "routes to #new" do
      expect(:get => "/breminale_dates/new").to route_to("breminale_dates#new")
    end

    it "routes to #show" do
      expect(:get => "/breminale_dates/1").to route_to("breminale_dates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/breminale_dates/1/edit").to route_to("breminale_dates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/breminale_dates").to route_to("breminale_dates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/breminale_dates/1").to route_to("breminale_dates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/breminale_dates/1").to route_to("breminale_dates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/breminale_dates/1").to route_to("breminale_dates#destroy", :id => "1")
    end

  end
end
