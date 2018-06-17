
require 'rubygems';
require 'nokogiri';
require 'open-uri';
require 'rest-client';

class CrawltempController < ApplicationController

  def index
    @websites = Website.where(user_id: current_user.id)
  end

  def search
    #page = Nokogiri::HTML(open("http://www.google.fr/"))
    #@crawl = page.css('title')
    #@crawl.to_xhtml(indent:3, indent_text:".")

    img_urls = Array.new
    img_captions = Array.new
    h1 = Array.new
    w3c= "https://validator.w3.org/nu/?doc="

    url = params[:url]
    website = Website.find(url)
    url = website.url
    html = RestClient.get(url)
    w3c_html = RestClient.get(w3c+url)
    doc = Nokogiri::HTML(html)
    w3c_doc = Nokogiri::HTML(w3c_html)

    score = 0
    #W3C
    w3c_count = 0
    w3c_doc.css('#results ol li').each do |s|
      w3c_count = w3c_count + 1
    end
    @w3c_result = w3c_count
    if w3c_count == 0
      score += 20
    elsif w3c_count < 5
      score += 15
    elsif w3c_count < 15
      score += 10
    elsif w3c_count < 25
      score += 5
    else
      score += 0
    end

    W3c.create(fault: w3c_count, website: website)
    #metatag traitement
    @meta_desc = doc.search("meta[name='description']").map{ |meta| meta }
    @meta_title = doc.css('title').map {|title| title }
    @meta_content = doc.search("meta[charset]").map{ |meta| meta }
    @meta_viewport = doc.search("meta[name='viewport']").map { |meta| meta }

    if @meta_desc[0]
      score += 5
    end
    if @meta_title[0]
      score += 5
    end
    if @meta_content[0]
      score += 5
    end
    if @meta_viewport[0]
      score += 5
    end

    #image traitement
    all_image_urls = doc.css('img').map{ |img| img['src'] if not img[:src].match(/^\.|\.jpg$|\.gif$|.png$/) }
    @all_image_urls = all_image_urls.compact
    if !@all_image_urls[0]
      @no_image_url = 1
      score += 10
    end
    if @all_image_urls.length < 10 && @all_image_urls.length > 0
      score += 5
    end
    img_alts = doc.css('img').map{ |img| img['src'] if img[:alt] == nil}
    @image_alts = img_alts.compact
    if !@image_alts[0]
      @no_image_alt = 1
      score += 10
    end
    if @image_alts.length < 10 && @image_alts.length > 0
      score += 5
    end

    #h1 traitement
    h1 = doc.css('h1')
    if !h1[0]
        @h1_error = "Il n'y a pas de h1 sur cette page."
    elsif h1[1]
        @h1_error = "Il y a plus de un h1 sur cette page."
    else
        @h1_error = "Il y a bien un seul h1 sur cette page."
        score += 10
    end


    # insert bdd
    if @meta_title[0]
      data_title = 1
    else
      data_title = 0
    end
    if @meta_desc[0]
      data_desc = 1
    else
      data_desc = 0
    end
    if @meta_viewport[0]
      data_viewport = 1
    else
      data_viewport = 0
    end
    if @meta_content[0]
      data_content = 1
    else
      data_content = 0
    end
    if @h1_error == "Il y a bien un seul h1 sur cette page."
      data_h1 = 1
    else
      data_h1 = 0
    end

    MetadataVerif.create(title: data_title, viewport: data_viewport, description: data_desc, charset: data_content, h1:data_h1, website: website)
    @metaResults = MetadataVerif.where(website: website).order(id: :desc).limit(1)
    W3c.create(fault:@w3c_result, website:website)
    @w3c_results = W3c.where(website:website).order(id: :desc).limit(1)


    score_total = score * 100 / 70
    @score = score_total
    website.score_w3c = score_total
    website.save
  end
end