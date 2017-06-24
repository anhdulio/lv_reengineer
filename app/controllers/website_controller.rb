class WebsiteController < ApplicationController
  include MenuConcern
  before_action :set_menubar
  before_action :set_locale
  # add filter bar to template, false by default

  def admin; end

  def health; end

  def homepage
    @header_info = { title: t('website.homepage.header.title'), subtitle: t('website.homepage.header.subtitle') }
    @features = Content.where(featured: true).take(3)
    @ex = { latest: Price.get_latest_exchange, l7d: Price.get_l7d_exchange }
    @clients = get_clients
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
    @contact_widget = true
    render 'contents'
  end

  def blogs
    @header_info = { title: t('website.blogs.header.title'), subtitle: t('website.blogs.header.subtitle') }
    @filter_bar = true
    @contents = get_contents(:blog)
    @cats = Blog.distinct.pluck(:category)
    @contact_widget = true
    render 'contents'
  end


  def market
    @header_info = { title: t('website.blogs.header.title'), subtitle: t('website.blogs.header.subtitle') }
    @contact_widget = true
    @products = []
    @ex = { latest: Price.get_latest_exchange, l7d: Price.get_l7d_exchange }

    Product.find_each do |product|
      product.update_product_price
      @products << product
    end
  end

  def products
    @header_info = { title: t('website.products.header.title'), subtitle: t('website.products.header.subtitle') }
    @filter_bar = true
    @contents = get_contents(:product)
    @cats = Product.distinct.pluck(:category)
    render 'contents'
    @contact_widget = true
  end

  private

  def get_contents(content_type)
    Content.where(type: content_type.to_s.capitalize)
  end

  def get_clients
    clients = {
      calofic: 'http://www.calofic.com.vn',
      songhygialai: 'http://www.songhygialai.com',
      vinacam: 'http://www.vinacam.com.vn',
      vinhphat: 'http://www.vinhphat.com',
      vinafood: 'http://www.vinafood2.com.vn'
    }
  end
  def website_params
    params.permit(:filter)
  end

  def set_locale
    I18n.locale = :en
  end

end
