class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
	validates :name, presence: true
	validates :desc, presence: true
end
