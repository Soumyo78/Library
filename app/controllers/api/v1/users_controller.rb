class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.includes([:book_copies]).page(params[:page])
    render json: users, meta: { message: "All users have been loaded" }, adapter: :json, status: 200
  end

  def show
    render json: @user, meta: { message: "User has been loaded" },  adapter: :json, status: 302
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, meta: { message: "User has been created successfully" }, adapter: :json, status: 201
    else
      render json: { error: user.errors, message: "Failed to create User." }, adapter: :json, status: 422
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, meta: { message: "User has been updated successfully" }, adapter: :json, status: 200
    else
      render json: { error: @user.errors, message: "Failed to update User." }, adapter: :json, status: 422
    end
  end

  def destroy
    if @user.destroy
      render json: { message: "User has been deleted successfully" }, adapter: :json, status: 200
    else
      render json: { error: @user.errors, message: "Failed to delete User." }, adapter: :json, status: 422
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
