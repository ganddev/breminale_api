require 'soundcloud'
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

  
  before_save  :resolve_soundcloud_user_id, on:[:create, :update]
  after_commit :push_to_device, on: [:create, :update, :destroy]
  

  def resolve_soundcloud_user_id()
  	if self.soundcloud_url.present? && !self.soundcloud_url.empty?
  		client = Soundcloud.new(:client_id => Rails.application.secrets.soundcloud_client_id)
  		begin
  			self.soundcloud_user_id = client.get('/resolve', :url => self.soundcloud_url)[:id]
  		rescue Soundcloud::ResponseError => e
  			self.soundcloud_user_id = ''
  		end
  		
  	end
  end

  def push_to_device()
    ::PushService.new().pushUpdates(self)
  end
end
