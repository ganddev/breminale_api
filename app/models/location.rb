class Location < ActiveRecord::Base
	
	has_attached_file :image, styles: {
    	thumb: '100x100>',
    	square: '200x200#',
    	medium: '300x300>'
  }

	belongs_to :user
	has_many :events, dependent: :destroy
	validates :name, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :user, presence: true
	validates :image,
	attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
  attachment_size: { less_than: 1.megabytes }

	after_initialize :init

	def init
		self.deleted = false
	end

	def self.values
		::Location.all.map do |location|
			[location.name, location.id]
		end
	end
end
