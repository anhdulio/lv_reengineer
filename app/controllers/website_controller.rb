class WebsiteController < ApplicationController
  include MenuConcern
  before_action :set_menubar
  # add filter bar to template, false by default

  def admin; end

  def health; end

  def homepage
    @header_info = { title: t('website.homepage.header.title'), subtitle: t('website.homepage.header.subtitle') }
    @features = Content.locale(I18n.locale).where(featured: true).take(3)
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
    @cats = Category.where(content: 'abouts')
    @contact_widget = true
    render 'contents'
  end

  def blogs
    @header_info = { title: t('website.blogs.header.title'), subtitle: t('website.blogs.header.subtitle') }
    @filter_bar = true
    @contents = get_contents(:blog)
    @cats = Category.where(content: 'blogs')
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
    @cats = Category.where(content: 'products')
    @contact_widget = true
    render 'contents'
  end

  private

  def get_contents(content_type)
    Content.locale(I18n.locale).where(type: content_type.to_s.capitalize)
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

end
