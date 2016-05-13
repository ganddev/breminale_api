class PushService

	def pushUpdates(ressource)
		if (::Device.where(device_type: 'android').count > 0)
			createGcmPushNotifications(createGcmDataFromRessource(ressource))
		end
		if (::Device.where(device_type: 'ios').count > 0)
			registration_ids = ::Device.where(device_type:'ios').pluck(:device_token)
			registration_ids.each { |token|
				createSilentApnsPushNotification(createApnsDataFromRessource(ressource), token)
			}
		end
	end

	def pushMessage(message)
		if(::Device.where(device_type: 'android').count > 0)
			createGcmPushNotifications(createGcmDataFromMessage(message))
		end

		if(::Device.where(device_type: 'ios').count > 0)
			registration_ids = ::Device.where(device_type:'ios').pluck(:device_token)
			registration_ids.each { |token|
				createApnsPushNotification(createApnsDataFromMessage(message), token)
			}
		end
	end

	def createGcmDataFromMessage(message)
		data = { :identifier => message.id, :ressource_type => message.class.name.split('::').last.downcase, :message => message.message}
	end

	def createApnsDataFromMessage(message)
		data = { :identifier => message.id, :ressource_type => message.class.name.split('::').last.downcase, :message => message.message}
	end

	def createGcmPushNotifications(data)
		n =  Rpush::Gcm::Notification.new
		n.app = Rpush::Gcm::App.find_by_name("android_app")
		n.registration_ids = ::Device.where(device_type:'android').pluck(:device_token)
		n.data = data
		n.save!
	end

	def createApnsPushNotification(data, token)
		n = Rpush::Apns::Notification.new
		n.app = Rpush::Apns::App.find_by_name("ios_app")
		n.device_token = token
		n.data = data
		n.save!
	end

	def createSilentApnsPushNotification(data, token)
		n = Rpush::Apns::Notification.new
		n.app = Rpush::Apns::App.find_by_name("ios_app")
		n.device_token = token
		n.data = data
		n.content_available = true
		n.save!
	end


	def createGcmDataFromRessource(ressource)
		data = { :identifier => ressource.id, :ressource_type => ressource.class.name.split('::').last.downcase }
	end

	def createApnsDataFromRessource(ressource)
		data = { :resource_type => ressource.class.name.split('::').last.downcase , :identifier => ressource.id, :content-available => "1" }
	end

	def device_token_valid?(device_token)
    device_token.chars.reject { |c| c == " " || c == "<" || c == ">" }.join.size == 64
  end

end