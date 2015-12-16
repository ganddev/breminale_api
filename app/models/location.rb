class Location < ActiveRecord::Base
	belongs_to :user
	has_many :events
	validates :name, presence: true
	validates :latitude, presence: true
	validates :longiotude, presence: true
end
