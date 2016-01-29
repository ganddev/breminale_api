class BreminaleDate < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy
  validates :datetime, presence: true
  validates :user, presence: true

  def isAllowedToEditBreminaleDate?(user)
		if self.user.id == user.id
			true
		else
			false
		end		
	end	
end
