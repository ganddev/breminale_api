class Message < ActiveRecord::Base
	belongs_to :user
	validates :message, presence: true, length: { in: 6..140 }

	after_commit :push_to_device, on: [:create, :update, :destroy]
  
  def push_to_device()
    ::PushService.new().pushMessage(self)
  end
end
