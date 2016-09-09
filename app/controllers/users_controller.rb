class UsersController < ApplicationController
  def index
    # render text: "im in the index action."
    # # render text: {"hello" => "world"}.to_json
    @users = User.all
    render json: @users
  end

  def show
    render json: params
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user
    else
      render(
      json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user.delete
      render json: user
    else
      render(
      json: user.error.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
    # params[:user].permit(:name, :email)
  end

end
