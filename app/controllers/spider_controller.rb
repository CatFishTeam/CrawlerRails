class SpiderController < ApplicationController
  include ApplicationHelper

  def index
    @websites = Website.where(user: current_user)
  end

  def search
    require 'spider'
    website = params[:url]
    website = Website.find(website)

    url = website.url

    datetime = Time.now

    count = 0
    score = 0

    @codes = Hash.new

    @nodes = []
    Spider.start_at(url) do |s|
      s.add_url_check {|a_url| a_url =~ %r{^#{url}.*} }

      s.on(:every) do |a_url, resp, prior_url|
        SpiderResult.create(:urlFrom => prior_url, :urlTo => a_url, :response =>resp.code, :website => website, :created_at => datetime)
        count += 1
        score += score_http_code(resp.code)

        if @codes.key?("#{resp.code}")
          @codes["#{resp.code}"] += 1
        else
          @codes["#{resp.code}"] = 1
        end


        @nodes << {:source => prior_url, :dest => a_url, :code => resp.code}
      end
    end

    if count === 0
      count = 1
    end
    score = (score * 100) / (count * 3)

    website.score_spider = score
    website.save

    @stat = Stat.where(website: website).first
    @stat.scoreSpider = score
    @stat.save
  end

  def list
    website = params[:url]
    website = Website.find(website)

    @dates = SpiderResult.select(:created_at).order(created_at: :desc).distinct

    @spiderResults = SpiderResult.where(website: website).order(created_at: :desc)

  end
end