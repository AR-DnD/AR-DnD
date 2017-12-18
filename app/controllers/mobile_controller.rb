class MobileController < ApplicationController
  protect_from_forgery with: :null_session
    def new

    end

    def adventures
      if params[:email] and params[:password]
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
          @adventures = user.adventures
        else
          render html: 'invalid'
        end
      else
        render html: 'invalid'
      end
    end
end
