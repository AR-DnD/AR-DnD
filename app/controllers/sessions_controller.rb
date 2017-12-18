class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in."
            redirect_to user_path(user.id)
        else
          respond_to do |format|
            format.js
          end
            # redirect_to root_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully logged out."
        redirect_to root_path
    end

end
