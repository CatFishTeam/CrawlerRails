class HomeController < ApplicationController
  def index
    if user_signed_in?
      @websites = Website.where(user: current_user)
    else
      redirect_to "/users/sign_in"
    end
  end

  def addWebsite
    url = params['url']
    if not url =~ /(https:\/\/)?(www.)?.+\..+/
      flash[:warning] = "Votre url n'est pas valide !"
    else
      flash[:success] = "Site bien ajouté !"
      @wbesite = Website.create(url: url, user: current_user)
    end
    redirect_to root_url
  end

  def removeWebsite
    @website = Website.find(params[:id])
    @website.destroy
    flash[:success] = "Site bien retiré !"
    redirect_to root_url
  end
end