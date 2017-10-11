class WebsiteController < ApplicationController
  include MenuConcern
  before_action :set_menubar
  # add filter bar to template, false by default

  def admin
    authenticate_admin!
  end

  def homepage
    @meta_title = t('website.homepage.header.title')
    @meta_description= t('website.homepage.header.subtitle')

    @header_info = { title: t('website.homepage.header.title'), subtitle: t('website.homepage.header.subtitle') }
    @features = Content.published.locale(I18n.locale).where(featured: true).order(published_at: :desc).take(3)
    @ex = { latest: Price.get_latest_exchange, l7d: Price.get_l7d_exchange }
    @clients = get_clients
    @products = []
    @contact_widget = true

    Product.locale(I18n.locale).find_each do |product|
      product.update_product_price
      @products << product
    end

    breadcrumb1 = Breadcrumb.new(root_url, t('website.breadcrumb.home'), "1")
    @breadcrumbs = [breadcrumb1]
  end

  def gcc
    @meta_title = t('website.gcc.meta_title')
    @meta_description= t('website.gcc.meta_desc')

    @header_info = { title: t('website.gcc.title'), subtitle: t('website.gcc.subtitle') }
    
    breadcrumb1 = Breadcrumb.new(root_url, t('website.breadcrumb.home'), "1")
    breadcrumb2 = Breadcrumb.new(gcc_url, t('website.breadcrumb.gcc'), "2")
    @breadcrumbs = [breadcrumb1, breadcrumb2]
  end

  def contact
    @meta_title = t('website.contacts.title')
    @meta_description= t('website.contacts.subtitle')

    @header_info = { title: t('website.contacts.title'), subtitle: t('website.contacts.subtitle') }
    @contact_widget = true

    breadcrumb1 = Breadcrumb.new(root_url, t('website.breadcrumb.home'), "1")
    breadcrumb2 = Breadcrumb.new("http://#{request.host}#{@menubar[:menu][:contact][:url]}", @menubar[:menu][:contact][:title], "2")
    @breadcrumbs = [breadcrumb1, breadcrumb2]
  end

  def abouts
    @meta_title = t('website.abouts.header.title')
    @meta_description= t('website.abouts.header.subtitle')

    @header_info = { title: t('website.abouts.header.title'), subtitle: t('website.abouts.header.subtitle') }
    @filter_bar = true
    @contents = get_contents(:about)
    @cats = Category.where(content: 'abouts')
    @contact_widget = true
    breadcrumb1 = Breadcrumb.new(root_url, t('website.breadcrumb.home'), "1")
    breadcrumb2 = Breadcrumb.new("http://#{request.host}#{@menubar[:menu][:abouts][:url]}", @menubar[:menu][:abouts][:title], "2")
    @breadcrumbs = [breadcrumb1, breadcrumb2]
    @blog_richcard = true
    render 'contents'
  end

  def blogs
    @meta_title = t('website.blogs.header.title')
    @meta_description= t('website.blogs.header.subtitle')

    @header_info = { title: t('website.blogs.header.title'), subtitle: t('website.blogs.header.subtitle') }
    @filter_bar = true
    @contents = get_contents(:blog)
    @cats = Category.where(content: 'blogs')
    @contact_widget = true
    breadcrumb1 = Breadcrumb.new(root_url, t('website.breadcrumb.home'), "1")
    breadcrumb2 = Breadcrumb.new("http://#{request.host}#{@menubar[:menu][:blogs][:url]}", @menubar[:menu][:blogs][:title], "2")
    @breadcrumbs = [breadcrumb1, breadcrumb2]
    @blog_richcard = true
    render 'contents'
  end

  def products
    @meta_title = t('website.products.header.title')
    @meta_description= t('website.products.header.subtitle')
    @product_richcard = true
    @header_info = { title: t('website.products.header.title'), subtitle: t('website.products.header.subtitle') }
    @filter_bar = true
    @contents = []
    get_contents(:product).each do |product|
      product.update_product_price
      @contents << product
    end
    @ex = { latest: Price.get_latest_exchange, l7d: Price.get_l7d_exchange }
    @cats = Category.where(content: 'products')
    @contact_widget = true
    breadcrumb1 = Breadcrumb.new(root_url, t('website.breadcrumb.home'), "1")
    breadcrumb2 = Breadcrumb.new("http://#{request.host}#{@menubar[:menu][:products][:url]}", @menubar[:menu][:products][:title], "2")
    @breadcrumbs = [breadcrumb1, breadcrumb2]
    render 'contents'
  end

  def market
    @meta_title = t('website.market.header.title')
    @meta_description= t('website.market.header.subtitle')
    @header_info = { title: t('website.market.header.title'), subtitle: t('website.market.header.subtitle') }
    @contact_widget = true
    @products = []
    @ex = { latest: Price.get_latest_exchange, l7d: Price.get_l7d_exchange }
    breadcrumb1 = Breadcrumb.new(root_url, t('website.breadcrumb.home'), "1")
    breadcrumb2 = Breadcrumb.new(@menubar[:menu][:market][:url], @menubar[:menu][:market][:title], "2")
    @breadcrumbs = [breadcrumb1, breadcrumb2]
    Product.locale(I18n.locale).find_each do |product|
      product.update_product_price
      @products << product
    end
  end

  private

  def get_contents(content_type)
    Content.published.locale(I18n.locale).where(type: content_type.to_s.capitalize)
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
