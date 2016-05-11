class Event < ActiveRecord::Base

	belongs_to :user
	belongs_to :location
	validates :name, presence: true
	validates :start_time, presence: true
	validates :description, presence: true
	validates :location_id, presence: true
	validates :user, presence: true
	validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  has_attached_file :image,
  :default_url => ""

	self.per_page = 10
	
  after_commit :push_to_device, on: [:create, :update, :destroy]
  
  def push_to_device()
    ::PushService.new().pushUpdates(self)
  end
end
