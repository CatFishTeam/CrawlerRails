
require 'rubygems';
require 'nokogiri';
require 'open-uri';

class CrawltempController < ApplicationController

  def index
    page = Nokogiri::HTML(open("http://www.google.fr/"))
    @crawl = page.css('title')
    @crawl.to_xhtml(indent:3, indent_text:".")
  end
end