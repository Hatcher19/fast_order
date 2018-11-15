json.extract! inventory, :id, :sku, :count_in, :count_out, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
