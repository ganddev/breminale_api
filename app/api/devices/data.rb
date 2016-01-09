module Devices
	class Data < Grape::API

		resource :devices do
			desc "creates a new device"
			params do
				requires :device_token, type: String, desc: "Device token of apns or gcm"
				requires :device_type, type: String, desc: "Is it a ios or android device"
			end
			post do

			end	
		end
	end	
end