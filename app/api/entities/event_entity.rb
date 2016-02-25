module Entities
	class Entities::EventEntity < ::Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Id of the event"}
		expose :name, documentation: {type: "String", desc: "Name of the event"}
		expose :description, documentation: {type: "String", desc: "Description of the event"}
		expose :image_url, documentation: {type: "String", desc: "An image for the event"}
		expose :location_id, documentation: {type: "Integer", desc: "The location where the event takes place"}
		expose :date_id, documentation: {type: "Integer", desc: "The day when the event takes place"}
		expose :deleted, documentation: {type: "Boolean", desc: "Is the event deleted or not"}
		expose :created_at
		expose :updated_at
	end
end