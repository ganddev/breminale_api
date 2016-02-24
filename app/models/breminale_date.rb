class BreminaleDate < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy
  validates :datetime, presence: true
  validates :user, presence: true
end
