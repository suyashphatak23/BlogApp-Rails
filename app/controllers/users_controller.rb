class UsersController < ApplicationController
    
    def index
        @users = User.paginate(page: params[:page], per_page: 2)
    end
    
    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            render :new, :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to @user
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to "/users", status: :see_other
    end
    
    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end

    private
    def user_params
      params.require(:user).permit(:username, :email, :password_digest)
    end

end