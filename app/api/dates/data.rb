module Dates
	class Data < Grape::API
		resource :dates do
			desc "list all dates"
			get do
				BreminaleDates.all
			end

			desc "Return on date object"
			params do
				requires :id, type: Integer, desc: "Desc of the date"
			end
			get ':id' do
				BreminaleDates.find_by_id(params[:id])
			end
		end
	end
end	