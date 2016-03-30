module Devices
	class Data < Grape::API

		resource :devices do
			desc "creates a new device"
			params do
				requires :device_token, type: String, desc: "Device token of apns or android device id"
				requires :device_type, type: String, desc: "Is it a ios or android device",default: 'android', values: ['android', 'ios']
				optional :device_id, type: String, desc: "Only necessary for android devices GCM"
			end
			post do
				device = ::Device.where(:device_token => params[:device_token]).first_or_create!(params)
				device.update_attribute(:device_id => params[:device_id])
			end	
		end
	end	
end