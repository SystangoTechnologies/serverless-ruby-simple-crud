require 'base64'

module ApplicationHelper
  def get_authorization_key(authorization)
    Base64.decode64(authorization) rescue false
  end
end
