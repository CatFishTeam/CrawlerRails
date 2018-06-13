class HomeController < ApplicationController
  def index
  end

  def addWebsite
    url = params[':url']
    @currentUser = current_user
    @wbesite = Website.create(url: url, user: current_user)
  end
end