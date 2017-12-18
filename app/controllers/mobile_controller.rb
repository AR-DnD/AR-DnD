class MobileController < ApplicationController
  protect_from_forgery with: :null_session
    def new

    end

    def test
      render html: 'success'
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

    def maps
      adventure = User.find(params[:user_id].to_i)
        .adventures[params[:adventure_id].to_i - 1]
      @maps = adventure.maps
    end
end
