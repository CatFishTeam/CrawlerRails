class HomeController < ApplicationController
  def index
    if user_signed_in?
      @websites = Website.where(user_id: current_user.id)
    else
      redirect_to "/users/sign_in"
    end
  end

  def addWebsite
    url = params['url']
    @wbesite = Website.create(url: url, user: current_user)
    #puts @wbesite.valid?
    redirect_to root_url
  end
end