class UsersController < ApplicationController
  def create
    #  params: {username: '', password: ''}
    user = User.create(user_params)

    is_valid = user.valid?

    if is_valid
      render json: { token: encode_token(user) }
    else
      render json: { erros: user.errors.full_messages }
    end
  end

  def profile
    user = User.find(user_id)
    render json: user
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
