class ApplicationController < ActionController::API

  def user_payload(user)
    { user_id: user.id }
  end

  def encode_token(user)
    JWT.encode(user_payload(user), 'otters', 'HS256')
  end

  def token
    token = request.headers['Authorization']
  end

  def decoded_token
    decoded_token = JWT.decode token, 'otters', true, {algorithm: 'HS256'}
  end

  def current_user
    user_id = decoded_token[0]['user_id']
    user = User.find(user_id)
  end
end
