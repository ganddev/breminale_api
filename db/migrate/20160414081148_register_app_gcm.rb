class RegisterAppGcm < ActiveRecord::Migration
  def change
  	app = Rpush::Gcm::App.new
    app.name = "android_app"
    app.auth_key = Rails.application.secrets.gcm_api_key
    app.connections = 1
    app.save!
  end
end
