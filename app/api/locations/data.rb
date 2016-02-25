module Locations
	class Data < Grape::API
		resource :locations do 
			desc "List all locations"
			get do
				locations = ::Location.all
				present locations, with: Entities::LocationEntity
			end
			desc "Returns a single location"
			params do 
        		requires :id, type: Integer, desc: "Id of the location"
      		end
      		get ':id' do
      			location = ::Location.find_by_id!(params[:id])
      			present location, with: Entities::LocationEntity
    		end
		end
	end
end