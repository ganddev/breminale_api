require 'rails_helper'

describe Entities::EventEntity do
  subject { described_class }
  
  it { is_expected.to represent :id }
  it { is_expected.to represent :name }
  it { is_expected.to represent :description }
  it { is_expected.to represent :location_id }
  it { is_expected.to represent :soundcloud_url }
  it { is_expected.to represent :soundcloud_user_id }
  it { is_expected.to represent :deleted }
  it { is_expected.to represent :created_at }
  it { is_expected.to represent :updated_at }
end