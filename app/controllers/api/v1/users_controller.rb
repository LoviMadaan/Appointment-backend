class Api::V1::UsersController < ApplicationController
    def index
      @users = User.includes(:appointments).order('created_at desc')
      if(@users)
        render json: @users, status: 200
      else
        render json: "NO users found", status: 404
      end
    end
  
    def show
      @user = User.where(id: params[:id]).includes(:appointments)
       if(@user)
        render json: @user, status: 200
       else
        render json: "No user found!", status: 404
       end
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: 201
      else
        render json: @user.error.full_messages, status: 500 
      end
    end
  
    def destroy
      @user = User.find_by_id(params[:id])
      if @user.destroy
        render json: 'user Successfully deleted', status: 200
      else
        render json: 'unable to delete the user!', status: unprocessable_entity
      end
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: 'User profile updated successfully', status: 201
      else
        render json: 'unable to update user', status: unprocessable_entity
      end
  
    end
  
    private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  end
  