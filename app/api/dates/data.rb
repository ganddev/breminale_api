module Dates
	class Data < Grape::API
		resource :dates do
			desc "list all dates"
			get do
				dates = ::BreminaleDate.all
				present dates, with: Entities::BreminaleDateEntity
			end
			desc "Return on date object"
			params do
				requires :id, type: Integer, desc: "Desc of the date"
			end
			get ':id' do
				date = ::BreminaleDate.find_by_id!(params[:id])
				present date, with: Entities::BreminaleDateEntity
			end
		end
	end
end	