module Events
  class Data < Grape::API
    
    before do
      validate_token!
    end
    resource :events do
      desc "List all events", headers: {
          "Authorization" => {
          description: "JWS Token which validates your identity",
          required: true
        }
      }
      get do
        Event.all
      end

      desc "Updates a single event", headers: {
         "Authorization" => {
          description: "JWS Token which validates your identity",
          required: true
        }
      }
      params do
        requires :id, type: Integer, desc: "Id of the event"
        requires :name, type: String, desc: "Name of the event"
        requires :desc, type: String, desc: "Description of the event"
        requires :start_date, type: DateTime, desc: "Start date and time of the event"
        requires :location_id, type: Integer, desc: "Id of the location where the event takes place"
        optional :image_url, type: String, desc: "An image for the event"
      end
      put ':id' do
        event = Event.find_by_id(id)
        if event.present?
            if event.isAllowedToEdit(current_user)

            else
              error!("403 - Forbidden to edit event", 403)
            end  
        else
          error!("404 - Event not found", 404) 
        end 
      end

      desc "Delete a single event", headers: {
        "Authorization" => {
          description: "JWS Token which validates your identity",
          required: true
        }
      }
      params do 
        requires :id, type: Integer, desc: "Id of the event"
      end

      delete ':id' do
        event = Event.find_by_id(id)
        if event.present?
            if event.isAllowedToEdit(current_user)
              event.destroy
            else
              error!("403 - Forbidden to edit event", 403)
            end
        else
          error!("404 - Event not found", 404)
        end 
      end  


      desc "create a new event", headers: {
        "Authorization" => {
          description: "JWS Token which validates your identity",
          required: true
        }
      }
      params do
        requires :id, type: Integer, desc: "Id of the event"
        requires :name, type: String, desc: "Name of the event"
        requires :desc, type: String, desc: "Description of the event"
        requires :start_date, type: DateTime, desc: "Start date and time of the event"
        requires :location_id, type: Integer, desc: "Id of the location where the event takes place"
        optional :image_url, type: String, desc: "An image for the event"
      end
      post do
        user = User.find_by_auth_token(auth_token: token)
        if user.present?
      	 Event.create!({name:params[:name],desc:params[:desc], user:user})
        else
          error!("404 User not found!", 404)
        end 
      end	
    end

  end
end