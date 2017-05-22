class WebsiteController < ApplicationController

  #add filter bar to template, false by default
  @filter_bar = false

  def homepage
    @filter_bar = true
  end

  def about
  end

  def market
  end

  def products
  end

end
