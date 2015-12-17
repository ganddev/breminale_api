module SessionHelpers extend Grape::API::Helpers


	def create_session_for(user)
		{'token' => issue_token(user)}
	end	

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

    def issue_token(user)
    	token = TokenProvider.issue_token({user_id: user.id})
    	user.update_attributes(auth_token: token)
    	return token
    end

    def authorize!(user, password)
 		has_valid_password = user && user.authenticate(password)
 		error!('Unauthorized', 401) unless has_valid_password
    end	
end	