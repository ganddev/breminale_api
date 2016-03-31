class Event < ActiveRecord::Base

	has_attached_file :image_url, styles: {
    	thumb: '100x100>',
    	square: '200x200#',
    	medium: '300x300>'
  	}


	belongs_to :user
	belongs_to :location
	belongs_to :date
	validates :name, presence: true
	validates :start_time, presence: true
	validates :description, presence: true
	validates :location_id, presence: true
	validates :breminale_date_id, presence: true
	validates :user, presence: true
end
