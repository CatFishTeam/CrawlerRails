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
    puts url
    if not url =~ /(https:\/\/)?(www.)?.+\..+/
      flash[:warning] = "URL NON VALIDE"
    else
      @wbesite = Website.create(url: url, user: current_user)
    end

    redirect_to root_url

  end
end