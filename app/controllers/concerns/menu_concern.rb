module MenuConcern
  extend ActiveSupport::Concern

  included do
    helper_method :set_menubar
  end

  def set_menubar
    logo_url = 'brand/loc_van_rice_logo.png'
    case I18n.locale
    when :vi
      @acat = Category.where(content: 'abouts').collect { |p| p.vi }
      @bcat = Category.where(content: 'blogs').collect { |p| p.vi }
      @pcat = Category.where(content: 'products').collect { |p| p.vi }
      market_url = emarket_path
      abouts_url = eabouts_path
      products_url = eproducts_path
      blogs_url = eblogs_path
    when :en
      @acat = Category.where(content: 'abouts').collect { |p| p.en }
      @bcat = Category.where(content: 'blogs').collect { |p| p.en }
      @pcat = Category.where(content: 'products').collect { |p| p.en }
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
    @filter_bar = false
    @contact_widget = false
  end
end