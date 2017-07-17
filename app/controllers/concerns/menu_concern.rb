module MenuConcern
  extend ActiveSupport::Concern

  included do
    helper_method :set_menubar
  end

  class Breadcrumb
    attr_accessor :href, :name, :position
    def initialize(href, name, position)
      @href = href
      @name = name
      @position = position
    end
  end

  def set_menubar
    logo_url = 'brand/loc_van_rice_logo.png'
    @acat = Category.where(content: 'abouts').collect { |p| p.locale }
    @bcat = Category.where(content: 'blogs').collect { |p| p.locale }
    @pcat = Category.where(content: 'products').collect { |p| p.locale }
    case I18n.locale
    when :vi
      market_url = vmarket_path
      abouts_url = vabouts_path
      products_url = vproducts_path
      blogs_url = vblogs_path
      contact_url = vcontact_path
    when :en
      market_url = emarket_path
      abouts_url = eabouts_path
      products_url = eproducts_path
      blogs_url = eblogs_path
      contact_url = econtact_path
    end
    menu = {
      logo: logo_url,
      menu: {
        market: { title: t('website.menubar.market'), url: market_url, sub: nil },
        abouts: { title: t('website.menubar.about'), url: abouts_url, sub: @acat },
        blogs: { title: t('website.menubar.blog'), url: blogs_url, sub: @bcat },
        products: { title: t('website.menubar.product'), url: products_url, sub: @pcat },
        contact: { title: t('website.menubar.contact'), url: contact_url, sub: nil }
      }
    }
    @menubar = menu
    @filter_bar = false
    @contact_widget = false
  end

end
