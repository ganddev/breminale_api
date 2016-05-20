module Devices
	class Data < Grape::API
		resource :devices do
			desc "Creates a new device" do
				success Entities::DeviceEntity
				headers XAuthToken: {
            			description: 'Validates your identity',
            			required: true
        				}
      end
			params do
				requires :device_token, type: String, desc: "Device token of APNS or GCM"
				requires :device_type, type: String, desc: "Is it a ios or android device",default: 'android', values: ['android', 'ios']
			end
			post do
				error!('Unauthorized', 401) unless headers['Xauthtoken'] == ENV['API_AUTHTOKEN']
				device = ::Device.where(:device_token => params[:device_token]).first_or_create(params)
				present device, with:  Entities::DeviceEntity				
			end	
		end
	end	
end