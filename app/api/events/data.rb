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

      desc "create a new event", headers: {
        "Authorization" => {
          description: "JWS Token which validates your identity",
          required: true
        }
      }
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