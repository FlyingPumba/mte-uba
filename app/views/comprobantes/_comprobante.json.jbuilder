json.extract! comprobante, :id, :type, :numeroserie, :fecha, :observation, :comprobantable_id, :comprobantable_type, :created_at, :updated_at
json.url comprobante_url(comprobante, format: :json)