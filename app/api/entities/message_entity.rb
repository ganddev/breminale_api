module Entities
	class Entities::MessageEntity < ::Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Id of the message"}
		expose :message, documentation: {type: "String", desc: "Content of the message"}
		expose :created_at, documentation: {type: "String", desc: "Date of the creation"}
	end
end