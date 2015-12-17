class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
	validates :name, presence: true
	validates :desc, presence: true
	validates :location, presence: true
	validates :user, presence: true
end
