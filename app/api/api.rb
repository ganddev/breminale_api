require 'grape-swagger'
class API < Grape::API
  prefix 'api'
  version 'v1', using: :path
	default_format :json

  error_formatter :json, ErrorFormatter

  rescue_from :all, backtrace: true do |e|
      Rails.logger.error "#{e.message}\n\n#{e.backtrace.join("\n")}"
      error!({status: e.status,message: e.message,errors: e.errors}, e.status)
  end

  helpers SessionHelpers
  
  mount Dates::Data
  mount Events::Data
  mount Locations::Data
  mount Devices::Data
  mount SignUp
  mount Auth
  	
  add_swagger_documentation(
        api_version: "v1",
        hide_documentation_path: true,
        mount_path: "/swagger_doc",
        hide_format: true
    )
end