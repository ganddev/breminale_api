class BreminaleDate < ActiveRecord::Base
  belongs_to :user
  has_many 	:events, dependent: :destroy
  validates :date_day, presence: true
  validates :user, presence: true


  def self.values
		::BreminaleDate.all.map do |breminaleDate|
			[breminaleDate.date_day, breminaleDate.id]
		end
	end

end
