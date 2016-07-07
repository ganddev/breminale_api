class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized(exception)
  	policy_name = exception.policy.class.to_s.underscore

   	flash[:alert] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
   	redirect_to(request.referrer || root_path)
  end
end
