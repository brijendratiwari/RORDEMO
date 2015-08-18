json.array!(@settingsmtps) do |settingsmtp|
  json.extract! settingsmtp, :id, :hostaddress, :post, :user_name, :password, :enable_ssl, :protocol, :user_id
  json.url settingsmtp_url(settingsmtp, format: :json)
end
