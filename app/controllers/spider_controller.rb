class SpiderController < ApplicationController
  include ApplicationHelper

  def index
    @websites = Website.where(user_id: current_user.id)
  end

  def search
    require 'spider'
    website = params[:url]
    website = Website.find(website)

    url = website.url

    datetime = Time.now

    @nodes = []
    Spider.start_at(url) do |s|
      s.add_url_check {|a_url| a_url =~ %r{^#{url}.*} }

      s.on(:every) do |a_url, resp, prior_url|
        puts "#{a_url} | #{prior_url} : #{resp.code}"
        SpiderResult.create(:urlFrom => prior_url, :urlTo => a_url, :response =>resp.code, :website => website, :created_at => datetime)

        @nodes << {:source => prior_url, :dest => a_url, :code => resp.code}
      end
    end
  end

  def list
    website = params[:url]
    website = Website.find(website)

    @spiderResults = SpiderResult.where(website: website).order(created_at: :desc)

    puts @spiderResults


  end
end