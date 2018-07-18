class StatsController < ApplicationController
  def index
    if user_signed_in?
      @websites = Website.where(user: current_user)
      #@stats = Stat.where(website: @websites.first)
      @stats = Stat.where(website: @websites.first)
      puts $stats.inspect
    else
      redirect_to "/users/sign_in"
    end
  end
end