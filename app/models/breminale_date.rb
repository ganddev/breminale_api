class BreminaleDate < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy
  validates :datetime, presence: true
  validates :user, presence: true


  def self.values
		::BreminaleDate.all.map do |breminaleDate|
			[breminaleDate.datetime, breminaleDate.id]
		end
	end

end
