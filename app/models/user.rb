class User < ActiveRecord::Base
	has_many :locations, dependent: :destroy
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true
end
