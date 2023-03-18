# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = 'Logged In Successfully'
        redirect_to root_path

      else
        flash.now[:alert] = 'Login Credentials Invalid'
        render 'new'
      end

    else
      flash.now[:alert] = 'User Not Found'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged Out Successfully'
    redirect_to root_path
  end
end
