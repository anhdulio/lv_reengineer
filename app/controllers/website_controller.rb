class WebsiteController < ApplicationController

  #add filter bar to template, false by default
  @filter_bar = false

  def homepage
  end

  def abouts
    @filter_bar = true
    @contents = get_contents
  end

  def blogs
    @filter_bar = true
    @contents = get_contents
  end

  def content
    @filter_bar = false
  end


  def market
  end

  def products
  end

  private
  def get_contents
    contents = Hash.new
    5.times do |i|
      contents["a#{i}".to_sym] = get_content(i)
    end
    return contents
  end

  def get_content(number)
    content = Hash.new
    content[:main_image] = "http://lorempixel.com/250/250/nature/#{number}"
    content[:title] = 'Getting Cheap Airfare For Last Minute Travel'
    content[:short] = 'If you live in New York City or travel to and from New York City a lot, you know all about the traffic there. Getting places is often next to impossible.'
    return content
  end

end
