class Event < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true
	validates :desc, presence: true
end
