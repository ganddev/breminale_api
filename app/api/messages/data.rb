module Messages
  class Data < Grape::API
    resource :messages do
      desc "List all messages" do
        success Entities::MessageEntity
      end
      get do
        messages  = ::Message.all
        present messages, with: Entities::MessageEntity
      end
      desc "Returns a single message" do
        success Entities::MessageEntity
      end
      params do
          requires :id, type: Integer, desc: "Id of the message"
      end
      get ':id' do
        message = ::Message.find_by_id!(params[:id])
        present message, with: Entities::MessageEntity
      end
    end
  end
end