module Locations
	class Data < Grape::API
		resource :locations do 
			desc "List all locations"
			get do
				locations = Location.all
				present locations, with: Entities::Location
			end
<<<<<<< HEAD
			desc "Returns a single location"
			params do 
        		requires :id, type: Integer, desc: "Id of the location"
      		end
      		get ':id' do
      			location = ::Location.find_by_id(params[:id])
      			present location, with: Entities::Location
    		end
=======
			desc "Creates a location", headers: {
				"Authorization" => {
          			description: "JWS Token which validates your identity",
          			required: true
        		}
			}
			params do
				requires :all, except: [:id], using: Entities::Location.documentation.except(:id)
			end
			post do
				if current_user.present?
					{ 'declared_params' => declared(params, include_missing: false) }
					location = ::Location.create({name: params[:name], latitude: params[:latitude], longitude: params[:longitude], user: current_user, description: params[:description], image: params[:image_url]})
					byebug
					if !location.valid?
						error!('400 error message' + location.errors.messages.to_json, 400)
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
        		requires :all, using: Entities::Location.documentation
			end	
			put ':id' do
				location = ::Location.find_by_id(parms[:id])
				if location.present?
					if location.isAllowedToEditLocation(current_user)
						updatedLocation = Location.update(params[:id], params)
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
				location = Location.find_by_id(params[:id])
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
>>>>>>> 5e69de761d7eafe9c593e816977475afaf55fa98
		end
	end
end