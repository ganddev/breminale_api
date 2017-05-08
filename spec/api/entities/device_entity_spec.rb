require 'rails_helper'

describe Entities::DeviceEntity do
  subject { described_class }

  it { is_expected.to represent :id }
  it { is_expected.to represent :device_token }
  it { is_expected.to represent :device_type }
end