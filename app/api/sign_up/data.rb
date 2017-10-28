module SignUp
  class Data
  resource :sign_up do
    desc "Sign up for a new user" do
      success Entities::MessageEntity
    end
    params do
      requires :email, type: String, desc: 'Email of the user'
      requieres :password, type: String, desc: 'Password for the new user'
      requieres :password_confirmation, type: String, desc: 'Password confirmation'
    end
    post do
      user = User.find_by_email(params[:email])
      error!("Für die Emailadresse #{params[:email]} existiert bereits ein Account.", 400) if user.present?
      result = CreateUser.perform(params)

    end
  end
end