module Events
  class Data < Grape::API
    resource :events do
      desc "List all events"
      get do
        events  = ::Event.all
        present events, with: Entities::EventEntity
      end
      desc "Returns a single event"
      params do
        requires :id, type: Integer, desc: "Id of the event"
      end
      get ':id' do
        event = ::Event.find_by_id(id)
        present event, with: Entities::EventEntity
      end
    end
  end
end