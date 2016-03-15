module Entities
	class Entities::BreminaleDateEntity < Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Id of the date"}
		expose :date_day, documentation: {type: "String", desc: "Date as ISO String"}
	end
end