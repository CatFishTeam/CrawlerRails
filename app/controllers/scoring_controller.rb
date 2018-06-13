class ScoringController < ApplicationController

  def index
    @websites = Website.where(user_id: current_user.id)
  end

  def search
    require 'net/http'
    require 'uri'
    require 'json'

    @websites = Website.where(user_id: current_user.id)

    website = params[:url]
    website = Website.find(website)

    @url = website.url

    uri = URI.parse("https://www.googleapis.com/pagespeedonline/v4/runPagespeed?url=#{@url} &key=AIzaSyCJtYr2YA84j56a81uk_WQSuIfR1z0ebvA&locale=fr")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    @response = http.request(request)
    @res = JSON.parse(@response.body)
    @score = @res["ruleGroups"]["SPEED"]["score"]
    @results = @res["formattedResults"]["ruleResults"]

    website.score_page_speed = @score
    website.save
  end
end
