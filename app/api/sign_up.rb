class SignUp < Grape::API
	desc 'Sign up a new user and returns access token'
	params do 
		requires :username, type: String, desc: 'Username'
		requires :password, type: String, desc: 'User password'
		requires :password_confirmation, type: String, desc: 'Password confirmation'
	end

	post :signup do
		user = User.find_by_username(params[:username])
		byebug
		if user.present?
			error!('400 user with username ' + params[:username] + 'already exists!', 400)
		else
			user = User.new({username: params[:username],password: params[:password], password_confirmation: params[:password_confirmation]})
			if !user.valid?
				error!('400 error message' + user.errors.messages.to_json, 400)
			end
			user.save
			#create JWT token
			create_session_for(user)
		end
	end		
end