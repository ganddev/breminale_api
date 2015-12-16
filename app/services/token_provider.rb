require 'jwt'

module TokenProvider
	class << self
		def issue_token(payload)
			JWT.encode(payload, Rails.application.secrest.secret_key_base)
		end

		def valid?(token)
			begin
				JWT.decopde(token, Rails.application.secrets.secret_key_base)
			end	
		end
	end		
end	