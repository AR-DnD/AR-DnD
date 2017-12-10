class WelcomeController < ApplicationController

  def home
    @adventures = Adventure.all
    #@adventures.order(created_at: :desc)
  end

  def about

  end

end
