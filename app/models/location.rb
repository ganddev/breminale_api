class Location < ActiveRecord::Base
	belongs_to :user
	has_many :events, dependent: :destroy
	validates :name, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :user, presence: true

	after_initialize :init

	def init
		self.deleted = false
	end

	def self.values
		::Location.all.map do |location|
			[location.name, location.id]
		end
	end

	def isAllowedToEditLocation?(user)
		if self.user.id == user.id
			true
		else
			false
		end		
	end	
end
