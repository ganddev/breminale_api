module Entities
	class Entities::LocationEntity < ::Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Id of the Location"}
		expose :name, documentation: {type: "String", desc: "Name of the location"}
		expose :latitude, documentation: {type: "Float", desc: "Latitude of the location"}
		expose :longitude, documentation: {type: "Float", desc: "Longitude of the location"}
		expose :image_url, documentation: {type: "String", desc: "An image of the location"}
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