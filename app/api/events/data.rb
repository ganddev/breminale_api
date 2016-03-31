module Events
  class Data < Grape::API
    resource :events do
      desc "List all events" do
        success Entities::EventEntity
      end
      get do
        events  = ::Event.all
        present events, with: Entities::EventEntity
      end
      desc "Returns a single event" do
        success Entities::EventEntity
      end
      params do
          requires :id, type: Integer, desc: "Id of the event"
      end
      get ':id' do
        event = ::Event.find_by_id!(params[:id])
        present event, with: Entities::EventEntity
      end
    end
  end
end