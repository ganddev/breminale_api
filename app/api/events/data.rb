module Events
  class Data < Grape::API
    resource :events do
      desc "List all events"
      get do
        events  = ::Event.all
        present events, with: Entities::Event
      end
      desc "Returns a single event"
      params do
<<<<<<< HEAD
        requires :id, type: Integer, desc: "Id of the event"
      end
      get ':id' do
        event = ::Event.find_by_id(id)
        present event, with: Entities::Event
      end
=======
        requires :all, using: Entities::Event.documentation
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
            if can? :delete, event
              
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
        requires :all, except: [:id], using: Entities::Event.documentation.except(:id)
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
>>>>>>> 5e69de761d7eafe9c593e816977475afaf55fa98
    end
  end
end