module Api::Helpers::SessionHelpers extend Grape::Api::Helpers

	def validate_token!
		begin 
			payload = TokenProvider.valid?(token)
			payload_user_id = payload.first["user_id"]
			@current_user = User.find(payload_user_id)
		rescue
			error!('Unauthorized', 401)
		end		
	end	

	def token
		request.headers['Authorization'].split(' ').last
	end

	def current_user
      @current_user
    end
end	