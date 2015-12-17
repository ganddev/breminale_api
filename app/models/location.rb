class Location < ActiveRecord::Base
	belongs_to :user
	has_many :events
	validates :name, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true

	after_initialize :init

	def init
		self.deleted = false
	end


	def isAllowedToEditLocation?(user)
		if self.user.id == user.id
			true
		else
			false
		end		
	end	
end
