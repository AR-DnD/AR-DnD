class MobileController < ApplicationController

    def new

    end

    def adventures
        @adventures = User.find_by(email: params[:email].downcase).adventures
    end
end
