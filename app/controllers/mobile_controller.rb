class MobileController < ApplicationController

    def new

    end

    def create_session
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
        end
    end
end
