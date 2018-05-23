class SpiderController < ApplicationController
  include ApplicationHelper

  def index

  end

  def search()
    require 'spider'
    url = params[:id]
    puts url

    @nodes = []
    Spider.start_at('http://www.isphers.com/') do |s|
      s.add_url_check {|a_url| a_url =~ %r{^http://www.isphers.com.*} }

      s.on(:every) do |a_url, resp, prior_url|
        puts "#{a_url} | #{prior_url} : #{resp.code}"

        @nodes << {:source => prior_url, :dest => a_url, :code => resp.code}
      end
    end
  end
end