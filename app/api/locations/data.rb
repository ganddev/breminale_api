module Locations
	class Data < Grape::API

		resource :locations do 
			desc "List all locations"

			get do
				Location.all
			end
		end
	end
end