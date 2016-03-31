module Entities
	class Entities::DeviceEntity < ::Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Id of the device"}
		expose :device_token, documentation: {type: "String", desc: "APNS or GCM token"}
		expose :device_type, documentation: {type: "String", desc: "Android or iOS"}
		expose :device_id, documentation: {type: "String", desc: "Device id of android device"}
	end
end