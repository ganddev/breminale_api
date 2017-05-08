require 'rails_helper'

describe Entities::LocationEntity do
  subject { described_class }
  
  it { is_expected.to represent :id }
  it { is_expected.to represent :name }
  it { is_expected.to represent :description }
  it { is_expected.to represent :deleted }
  it { is_expected.to represent :created_at }
  it { is_expected.to represent :updated_at }

  context 'latitude' do
    it "expose latitude" do
      expect(subject.exposures).to have_key(:latitude)
    end
  end

  context 'longitude' do
  	it 'expose longitude' do
  		expect(subject.exposures).to have_key(:longitude)
  	end
  end
end