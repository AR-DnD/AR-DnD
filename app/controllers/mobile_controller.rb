class MobileController < ApplicationController
  protect_from_forgery with: :null_session
    def new

    end

    def test
      render html: 'success'
    end

    def adventures
      user = User.find_by(email: params[:email].downcase)
      @adventures = user.adventures
    end

    def maps
      adventure = User.find(params[:user_id].to_i)
        .adventures[params[:adventure_id].to_i - 1]
      @maps = adventure.maps
    end
end
