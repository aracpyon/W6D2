class UsersController < ApplicationController
    def index
        if params.has_key?(:username)
            # @user = User.find_by(username: params[:username])
            @user = User.where('users.username like ?', "%#{params[:username]}%")
            # @user = User.where("users.username like '%:username%'", username: params[:username]) 
            # @user = User.where("users.username like %#{params :username}%") 
        else #figure out the syntax above
            @user = User.all
        end
        render json: @user
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find(params[:id])
        name = user.username
        user.destroy
        render json: "Successfully destroyed #{name}."
        
        
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end