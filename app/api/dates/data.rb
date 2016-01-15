module Dates
	class Data < Grape::API
		before do
    		validate_token!
    	end
		resource :dates do
			desc "list all dates", headers: {
          		"Authorization" => {
          			description: "JWS Token which validates your identity",
          			required: true
        		}
      		}
			get do
				BreminaleDates.all
			end
			desc "creates a single date", headers: {
				"Authorization" => {
					description: "JWS Token which validates your identity",
					required: true
				}
			}
			params do
				requires :date, type: DateTime, desc: "Date of the date object"
			end
			post do 
				{ 'declared_params' => declared(params, include_missing: false) }
				breminaledate = BreminaleDate.new()
				if breminaledate.valid?
					breminaledate.save
					{"msg" => "Added date", "date" => breminaledate.to_json}
				end	
			end
			desc "updates a single date", headers: {
				"Authorization" => {
					description: "JWS Token which validates your identity",
          			required: true
				}
			}
			params do
				requires :id, type: Integer, desc: "Id of the ressource"
				requires :date, type: DateTime, desc: "date of the date"
			end
			put ':id' do
				breminaledate = BreminaleDate.find_by_id(params[:id])
				if breminaledate.present?
					if breminaledate.isAllowedToEditBreminaleDate(current_user)
						BreminaleDate.update(params[:id], params)
					else
						error!("403 - Not allowed to update date ressource", 403)
					end
				else
          			error!("404 - Date not found", 404) 
        		end
			end
			desc "Deletes a single date object", headers: {
				"Authorization" => {
					description: "JWS Token which validates your identity",
          			required: true
				}
			}
			params do
				requires :id, type: Integer, desc: "Id of the date ressource"
			end
			delete ':id' do
				breminaledate = BreminaleDate.find_by_id(params[:id])
				if breminaledate.present?
					if breminaledate.isAllowedToEditBreminaleDate(current_user)
						breminaledate.destroy
						{"msg" => "Deleted date ressource"}
					else
						error!("403 - Not allowed to update date ressource", 403)
					end	
				else 
					error!("404 - Date not found", 404) 
				end
			end
		end	
	end
end	