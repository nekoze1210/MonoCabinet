json.array!(@items) do |item|
  json.extract! item, :id, :item_name, :maker, :image_url
  json.url item_url(item, format: :json)
end
