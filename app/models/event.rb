class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
	belongs_to :date
	validates :name, presence: true
	validates :start_time, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :date, presence: true
	validates :user, presence: true
end
