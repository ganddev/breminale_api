class User < ActiveRecord::Base
	has_many :locations, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :breminale_dates, dependent: :destroy
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true

	has_secure_password
end
