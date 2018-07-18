class StatsController < ApplicationController
  def index
    if user_signed_in?
      @website = Website.find(params[:id])
      @websites = Website.where(user: current_user)
      @stats = Stat.where(website: @website)
      puts $stats.inspect
    else
      redirect_to "/users/sign_in"
    end
  end
end