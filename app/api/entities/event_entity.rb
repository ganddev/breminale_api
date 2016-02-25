module Entities
	class Entities::EventEntity < ::Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Id of the event"}
		expose :name, documentation: {type: "String", desc: "Name of the event"}
		expose :description, documentation: {type: "String", desc: "Description of the event"}
		expose :date_id, documentation: {type: "Integer", desc: "The day when the event takes place"}
		expose :location_id, documentation: {type: "Integer", desc: "The location where the event takes place"}
		expose :image_url, documentation: {type: "String", desc: "An image for the event"}
		expose :start_time, documentation: {type: "String", desc: "The start time of the event"}
		expose :soundcloud_url, documentation: {type: "String", desc: "Url to the soundcloud profile"}
		expose :deleted, documentation: {type: "Boolean", desc: "Is the event deleted or not"}
		expose :created_at
		expose :updated_at
	end
end