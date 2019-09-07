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
    render json: current_user
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
