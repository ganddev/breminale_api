class Profile::SearchController < ApplicationController
	before_action :authenticate_user!

	def search
    @events = current_user.events.where("deleted = false AND name LIKE ?", "%#{params[:name]}%")
  end

	def search_params
		params.permit(:name)
	end
end
