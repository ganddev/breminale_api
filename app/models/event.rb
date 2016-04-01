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

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
end
