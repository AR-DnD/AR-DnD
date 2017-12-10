class WelcomeController < ApplicationController

  def home
    @adventures = Adventure.all
  end

  def about

  end

end
