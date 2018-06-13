
require 'rubygems';
require 'nokogiri';
require 'open-uri';
require 'rest-client';

class CrawltempController < ApplicationController

  def index
    @websites = Website.where(user: current_user)
  end

  def search
    #page = Nokogiri::HTML(open("http://www.google.fr/"))
    #@crawl = page.css('title')
    #@crawl.to_xhtml(indent:3, indent_text:".")

    img_urls = Array.new
    img_captions = Array.new
    h1 = Array.new
    w3c= "https://validator.w3.org/nu/?doc="


    website = params[:url]
    website = Website.find(website)

    url = website.url

    html = RestClient.get(url)
    w3c_html = RestClient.get(w3c+url)
    doc = Nokogiri::HTML(html)
    w3c_doc = Nokogiri::HTML(w3c_html)

    #W3C
    w3c_count = 0
    w3c_doc.css('#results ol li').each do |s|
      w3c_count = w3c_count + 1
    end
    @w3c_result = w3c_count

    #metatag traitement
    @meta_desc = doc.search("meta[name='description']").map{ |meta| meta }
    @meta_title = doc.css('title').map {|title| title }
    @meta_content = doc.search("meta[charset]").map{ |meta| meta }
    @meta_viewport = doc.search("meta[name='viewport']").map { |meta| meta }


  #image traitement
    all_image_urls = doc.css('img').map{ |img| img['src'] if not img[:src].match(/^\.|\.jpg$|\.gif$|.png$/) }
    @all_image_urls = all_image_urls.compact
    if !@all_image_urls[0]
      @no_image_url = 1
    end
    img_alts = doc.css('img').map{ |img| img['src'] if img[:alt] == nil}
    @image_alts = img_alts.compact
    if !@image_alts[0]
      @no_image_alt = 1
    end

    #h1 traitement
    h1 = doc.css('h1')
    if !h1[0]
        @h1_error = "Il n'y a pas de h1 sur cette page."
    elsif h1[1]
        @h1_error = "Il y a plus de un h1 sur cette page."
    else
        @h1_error = "Il y a bien un seul h1 sur cette page."
    end
  end
end