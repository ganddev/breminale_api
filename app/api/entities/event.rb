class Entities::Event < Grape::Entity
		expose :id, documentation: {type: Integer, desc: "Id of the event"}
		expose :name, documentation: {type: String, desc: "Name of the event"}
		expose :desc, documentation: {type: String, desc: "Description of the event"}
		expose :image_url, documentation: {type: String, desc: "An image for the event"}
		expose :location_id, documentation: {type: Integer, desc: "The location where the event takes place"}
		expose :date_id, documentation: {type: Integer, desc: "The day when the event takes place"}
		expose :created_at
		expose :updated_at
end