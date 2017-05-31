class WebsiteController < ApplicationController
  before_action :set_menubar
  # add filter bar to template, false by default
  @filter_bar = false
  @contact_widget = false

  def homepage
    @header_info = { title: t('website.homepage.header.title'), subtitle: t('website.homepage.header.subtitle') }
    @features = Content.where(featured: true).take(3)
    @ex = { latest: Price.get_latest_exchange, l7d: Price.get_l7d_exchange }
    @clients = get_clients(10)
    @products = []
    @contact_widget = true

    Product.find_each do |product|
      product.update_product_price
      @products << product
    end

  end

  def abouts
    @header_info = { title: t('website.abouts.header.title'), subtitle: t('website.abouts.header.subtitle') }
    @filter_bar = true
    @contents = get_contents(:about)
    @cats = About.distinct.pluck(:category)
    render 'contents'
  end

  def blogs
    @header_info = { title: t('website.blogs.header.title'), subtitle: t('website.blogs.header.subtitle') }
    @filter_bar = true
    @contents = get_contents(:blog)
    @cats = Blog.distinct.pluck(:category)
    render 'contents'
  end


  def market
  end

  def products
    @header_info = { title: t('website.products.header.title'), subtitle: t('website.products.header.subtitle') }
    @filter_bar = true
    @contents = get_contents(:product)
    @cats = Product.distinct.pluck(:category)
    render 'contents'
  end

  def content
    @filter_bar = false
  end

  private

  def get_contents(content_type)
    Content.where(type: content_type.to_s.capitalize)
  end

  def set_menubar
    logo_url = 'brand/loc_van_rice_logo.png'
    @acat = About.all.select(:category).distinct.collect { |p| [p.category] }
    @bcat = Blog.all.select(:category).distinct.collect { |p| [p.category] }
    @pcat = Product.all.select(:category).distinct.collect { |p| [p.category] }

    case I18n.locale
    when :vi
      market_url = emarket_path
      abouts_url = eabouts_path
      products_url = eproducts_path
      blogs_url = eblogs_path
    when :en
      market_url = emarket_path
      abouts_url = eabouts_path
      products_url = eproducts_path
      blogs_url = eblogs_path
    end

    menu = {
      logo: logo_url,
      menu: {
        market: { title: t('website.menubar.market'), url: market_url, sub: nil },
        abouts: { title: t('website.menubar.about'), url: abouts_url, sub: @acat },
        blogs: { title: t('website.menubar.blog'), url: blogs_url, sub: @bcat },
        products: { title: t('website.menubar.product'), url: products_url, sub: @pcat }
      }
    }
    @menubar = menu
  end

  def get_clients(numbers)
    clients = []
    numbers.times do |i|
      client = {
        url: "##{i}",
        image: "http://lorempixel.com/300/300/business/#{i}/"
      }
      clients << client
    end
    return clients
  end

  def website_params
    params.permit(:filter)
  end

end
