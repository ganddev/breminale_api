module Entities
	class Entities::DeviceEntity < ::Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Id of the device"}
		expose :device_token, documentation: {type: "String", desc: "APNS or GCM token", required: true}
		expose :device_type, documentation: {type: "String", desc: "Android or iOS", required: true, default: 'android',values: ['android', 'ios']}
	end
end