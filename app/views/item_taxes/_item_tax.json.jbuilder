json.extract! item_tax, :id, :tax_name, :tax_type, :tax, :created_at, :updated_at
json.url item_tax_url(item_tax, format: :json)
