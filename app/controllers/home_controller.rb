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
    if not url =~ /(https:\/\/)?(www.)?.+\..+/
      flash[:warning] = "Votre url n'est pas valide !"
    else
      @wbesite = Website.create(url: url, user: current_user)
    end

    redirect_to root_url

  end
end