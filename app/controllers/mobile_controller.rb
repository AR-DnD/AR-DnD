class MobileController < ApplicationController
  protect_from_forgery with: :null_session
    def new

    end

    def test
      render html: 'success'
    end

    def adventures
        @adventures = User.find_by(email: params[:email].downcase).adventures
    end
end
