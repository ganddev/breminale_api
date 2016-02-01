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
        requires :all, using: Event.documentation
      end
      put ':id' do
        event = Event.find_by_id(params[:id])
        if event.present?
            if event.isAllowedToEdit(current_user)
              Event.update(params[:id],params)
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
        event = Event.find_by_id(params[:id])
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


      desc 'create a new event', headers: {
        "Authorization" => {
          description: "JWS Token which validates your identity",
          required: true
        }
      }
      params do
        requires :all, except: [:id], using: Event.documentation.except(:id)
      end
      post do
        if current_user.present?
      	 @newevent = current_user.events.new({name:params[:name],desc:params[:desc], user:current_user})
         if newevent.valid?
           newevent.save
         end
        else
          error!("404 User not found!", 404)
        end 
      end	
    end

  end
end