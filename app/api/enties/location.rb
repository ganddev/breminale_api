class Location < Grape::Entity
	expose :id, documentation: {type: Integer, desc: "Id of the Location"}
	expose :name, documentation: {type: String , desc: "Name of the location"}
	expose :latitude, documentation: {type: Float, values: -90.0..+90.0,  desc: "Latitude of the location"}
	expose :longitude, documentation: {type: Float, values: -180.0..+180.0, desc: "Longitude of the location"}
	expose :image_url, documentation: {type: String, desc: "An image of the location"}
	expose :description, documentation: {type: String, desc: "Description for the location"}
end