module Devices
	class Data < Grape::API
		resource :devices do
			desc "creates a new device"
			params do
				requires :device_token, type: String, desc: "Device token of APNS or GCM"
				requires :device_type, type: String, desc: "Is it a ios or android device",default: 'android', values: ['android', 'ios']
				optional :device_id, type: String, desc: "Only necessary for android"
			end
			post do
				device = ::Device.where(:device_id => params[:device_token]).first_or_create(params)
				device.update_attribute(:device_token, params[:device_token])
				present device, with:  Entities::DeviceEntity
			end	
		end
	end	
end