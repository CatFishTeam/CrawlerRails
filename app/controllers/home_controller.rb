class HomeController < ApplicationController
  def index
    @websites = Website.where(user_id: current_user.id)
  end

  def addWebsite
    url = params['url']
    @wbesite = Website.create(url: url, user: current_user)
    #puts @wbesite.valid?
    redirect_to root_url
  end
end