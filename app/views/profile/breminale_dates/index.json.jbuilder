json.array!(@breminale_dates) do |breminale_date|
  json.extract! breminale_date, :id
  json.url breminale_date_url(breminale_date, format: :json)
end
