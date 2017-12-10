class WelcomeController < ApplicationController

  def home
    @adventures = Adventure.all
    @sortby = :created_at
  end

  def sort_adventures
    @adventures = Adventure.all
    if params["/sort_adventures"]["sortby"] == "Most Popular"
      @sortby = :times_copied
    elsif params["/sort_adventures"]["sortby"] == "Newest"
      @sortby = :created_at
    end
    respond_to do |format|
      format.js
    end
  end

  def about

  end


end
