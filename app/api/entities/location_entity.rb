module Entities
	class Entities::LocationEntity < ::Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Id of the Location"}
		expose :name, documentation: {type: "String", desc: "Name of the location"}
		expose :latitude, documentation: {type: "Float", desc: "Latitude of the location"}
		expose :longitude, documentation: {type: "Float", desc: "Longitude of the location"}
		expose :original_image_url, documentation: {type: "String", desc: "Link to the original image" } do |location, options|
			location.image.url(:original)
		end
		expose :medium_image_url, documentation: {type: "String", desc: "Link to the medium image." } do |location, options|
			location.image.url(:medium)
		end
		expose :thumb_image_url, documentation: {type: "String", desc: "Link to the thumb image." } do |location, options|
			location.image.url(:thumb)
		end
		expose :description, documentation: {type: "String", desc: "Description for the location"}
		expose :deleted, documentation: {type: "Boolean", desc: "Is the location delted or not"}
		expose :created_at
		expose :updated_at
		def latitude
    		object.latitude.to_f
  		end

  		def longitude
  			object.longitude.to_f
  		end
	end
end