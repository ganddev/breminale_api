module Locations
	class Data < Grape::API
		before do
      		validate_token!
    	end
		resource :locations do 
			desc "List all locations", headers: {
				"Authorization" => {
          			description: "JWS Token which validates your identity",
          			required: true
        		}
			}
			get do
				Location.all
			end

			desc "Creates a location", headers: {
				"Authorization" => {
          			description: "JWS Token which validates your identity",
          			required: true
        		}
			}
			params do
				requires :name, type: String
				requires :latitude, type: BigDecimal
				requires :longitude, type: BigDecimal
			end
			post do
				user = User.find_by_auth_token(token)
				if user.present?
					location = Location.new({name: params[:name], latitude: params[:latitude], longiotude: params[:longitude], user: user})
					if location.valid?
						location.save
					end	
				end
			end	
		end
	end
end