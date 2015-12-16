class User < ActiveRecord::Base
	authenticates_with_sorcery!
	has_many :locations, dependent: :destroy
	validates :username, presence: true, uniqueness: true
	validates :password, length: { minimum: 6 }, on: :create
end
