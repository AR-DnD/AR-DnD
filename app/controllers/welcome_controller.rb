class WelcomeController < ApplicationController

  def home
    @adventures = Adventure.all
    @by = :times_copied
    @order = :desc
  end

  def sort_adventures
    @adventures = Adventure.all
    #@by = :times_copied
    #@order = :desc
    if params["/sort_adventures"]["sortby"] == "Most Popular"
      @by = :times_copied
      @order = :desc
      p "Here"
    elsif params["/sort_adventures"]["sortby"] == "Newest"
      @by = :created_at
      @order = :asc
    end
    respond_to do |format|
      format.js
    end
  end

  def about

  end


end
