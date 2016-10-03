class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: params
  end

  def update
    user = User.find_by(id: params[:id])
    user.update(params[:user].permit(:name, :email))
    render json: user
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: user
  end



end
