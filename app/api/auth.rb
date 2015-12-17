class Auth < API

	resource :auth do
		desc 'Authenticate user and return user object / access token'
		params do
			requires :username, type: String, desc: 'Username'
			requires :password, type: String, desc: 'Password of user'
		end

		post :session do
			user = User.find_by_username(params[:username])
			authorize!(user, params[:password])
			create_session_for(user)
		end

		desc 'Return the current token? or maybe not', headers: {
			"Authorization" => {
          		description: "JWS Token which validates your identity",
          		required: true
        	}
		}
		get :session do
			validate_token!
			{'token' => token}
		end

		desc 'Destroy the access token', headers: {
			"Authorization" => {
          		description: "JWS Token which validates your identity",
          		required: true
        	}
		}
		delete :session do
			validate_token!
			if current_user.auth_token == token
				current_user.updateAttribute(auth_token: "")
				{'msg' => 'Log out user'}
			end	
		end	
	end
end