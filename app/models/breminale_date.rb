class BreminaleDate < ActiveRecord::Base
  belongs_to :user
  validates :datetime, presence: true

  def isAllowedToEditBreminaleDate?(user)
		if self.user.id == user.id
			true
		else
			false
		end		
	end	
end
