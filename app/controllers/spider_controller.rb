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

    count = 0
    score = 0

    @nodes = []
    Spider.start_at(url) do |s|
      s.add_url_check {|a_url| a_url =~ %r{^#{url}.*} }

      s.on(:every) do |a_url, resp, prior_url|
        puts "#{a_url} | #{prior_url} : #{resp.code}"
        #SpiderResult.create(:urlFrom => prior_url, :urlTo => a_url, :response =>resp.code, :website => website, :created_at => datetime)


        count += 1
        score += score_http_code(resp.code)

        @nodes << {:source => prior_url, :dest => a_url, :code => resp.code}
      end
    end

    score = (score * 100) / (count * 3)
    puts score

  end

  def list
    website = params[:url]
    website = Website.find(website)

    @spiderResults = SpiderResult.where(website: website).order(created_at: :desc)

    puts @spiderResults


  end
end