json.extract! line_item, :id, :league, :team, :division, :shirtcolor, :inkcolor, :shirtsize, :quantity, :user_id, :order_id, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)
