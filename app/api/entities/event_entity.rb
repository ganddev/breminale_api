module Entities
	class Entities::EventEntity < ::Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Id of the event"}
		expose :name, documentation: {type: "String", desc: "Name of the event"}
		expose :description, documentation: {type: "String", desc: "Description of the event"}
		expose :location_id, documentation: {type: "Integer", desc: "The location where the event takes place"}
		expose :original_image_url, documentation: {type: "String", desc: "Link to the original image" } do |event, options|
			event.image.url(:original)
		end
		expose :medium_image_url, documentation: {type: "String", desc: "Link to the medium image." } do |event, options|
			event.image.url(:medium)
		end
		expose :thumb_image_url, documentation: {type: "String", desc: "Link to the thumb image." } do |event, options|
			event.image.url(:thumb)
		end
		expose :start_time, documentation: {type: "String", desc: "The start time of the event"}
		expose :soundcloud_url, documentation: {type: "String", desc: "Url to the soundcloud profile"}
		expose :deleted, documentation: {type: "Boolean", desc: "Is the event deleted or not"}
		expose :created_at
		expose :updated_at
	end
end