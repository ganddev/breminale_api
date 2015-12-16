module Events
  class Data < Grape::API

    resource :events do
      desc "List all events"
      get do
        Event.all
      end

      desc "create a new event"
      params do
      	requires :name, type: String
      	requires :desc, type: String
      end
      post do
      	Event.create!({name:params[:name],desc:params[:desc]})
      end	
    end

  end
end