class Device < ActiveRecord::Base
	validates :device_token, presence: true, uniqueness: true
	validates :device_type, presence: true 
end
