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
				requires :all, except: [:id], using: Location.documentation.except(:id)
			end
			post do
				user = User.find_by_auth_token(token)
				if user.present?
					{ 'declared_params' => declared(params, include_missing: false) }
					location = Location.new({name: params[:name], latitude: params[:latitude], longitude: params[:longitude], user: user, description: params[:description], image: params[:image_url]})
					if location.valid?
						location.save
						{"msg" => "Added location", "location" => location.to_json}
					end	
				end
			end	

			desc "Updates a location", headers: {
				"Authorization" => {
          			description: "JWS Token which validates your identity",
          			required: true
        		}
			}
			params do
        		requires :all, using: Location.documentation
			end	
			put ':id' do
				location = Location.find_by_id(id)
				if location.present?
					if location.isAllowedToEditLocation(current_user)

					else
						error!("403 - Not allowed to update location", 403)
					end	
				else
					error!("404 - Location with not found!", 404)
				end	
			end

			desc "Deletes a location", headers: {
				"Authorization" => {
          			description: "JWS Token which validates your identity",
          			required: true
        		}
			}
			params do
				requires :id, type: Integer, desc: "id of the location"
			end
			delete ':id' do
				location = Location.find_by_id(id)
				if location.present?
					if location.isAllowedToEditLocation(current_user)
						location.destroy
					else
						error!("403 - Not allowed to delete location")
					end		
				else
					error!("404 - Location with not found", 404)
				end	
			end	
		end
	end
end