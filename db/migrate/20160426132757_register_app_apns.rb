class RegisterAppApns < ActiveRecord::Migration
  def change
  	app = Rpush::Apns::App.new
	app.name = "ios_app"
	app.certificate = File.read("#{Rails.root}/config/push.pem")
	app.environment = "sandbox" # APNs environment.
	app.password = Rails.application.secrets.apns_password
	app.connections = 1
	app.save!
  end
end
