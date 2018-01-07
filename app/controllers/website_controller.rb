class WebsiteController < ApplicationController
  include MenuConcern
  before_action :set_menubar
  # add filter bar to template, false by default

  def admin
    authenticate_admin!
  end

  def homepage
    @intendbox = true
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
      if product.category.en != "Good rice"
        @products << product
      end
    end

    breadcrumb1 = Breadcrumb.new(root_url, t('website.breadcrumb.home'), "1")
    @breadcrumbs = [breadcrumb1]
  end

  def gcc
    @intendbox = true
    @gcc = get_gcc
    @analytics = ['visit_lazada','buy_gcc']
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
    @intendbox = true
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
    @intendbox = true
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
      if product.category.en != "Good rice"
        @products << product
      end
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

  def get_gcc
    gcc = {
      xop: {
        title: 'Gạo Xốp Chén Cơm',
        price: '15,000 VND',
        saleprice: '11,900 VND',
        description: 'Gạo Xốp Chén cơm được chế biến từ hạt lúa mùa 6 tháng của vùng biên giới phía nam giáp với nước bạn Campuchia. Hạt cơm nở xốp và không dính vào nhau tạo cảm giác khoái khẩu khi nhai.',
        image: 'http://storage.googleapis.com/singular-pixel-4346/Public/gcc-xop.jpg',
        seo: 'Gao xop chen com',
        view: 'http://locvanrice.com/products/contents/gao-xop-chen-com',
        shop: 'http://www.lazada.vn/gao-xop-lua-mua-chen-com-ngon-10-kgs-10577348.html?spm=a2o7f.10605548.0.0.64f164fcZf1bg3'
      },
      deo: {
        title: 'Gạo Dẻo Chén Cơm',
        price: '15,000 VND',
        saleprice: '12,700 VND',
        description: 'Gạo Dẻo Chén cơm được chế biến từ hạt lúa ngắn ngày của bà con vùng Sóc Trăng - Trà Vinh. Hạt cơm dẻo kết dính vào nhau cùng với vị thơm ngọt tạo cảm giác ngon miệng.',
        image: 'http://storage.googleapis.com/singular-pixel-4346/Public/gcc-deo.jpg',
        seo: 'Gao deo chen com',
        view: 'http://locvanrice.com/products/contents/gao-chen-com',
        shop: 'http://www.lazada.vn/gao-deo-chen-com-ngon-10-kgs-8153102.html?spm=a2o7f.10605548.0.0.64f164fcZf1bg3'
      },
      mem: {
        title: 'Gạo Mềm Chén Cơm',
        price: '15,000 VND',
        saleprice: '12,100 VND',
        description: 'Gạo Mềm Chén cơm được chế biến từ hạt lúa ngắn ngày của bà con vùng tứ giác Long Xuyên. Hạt cơm mềm, vị ngọt có hương thơm nhẹ dễ chịu và không bị khô khi để nguội.',
        image: 'http://storage.googleapis.com/singular-pixel-4346/Public/gcc-mem.jpg',
        seo: 'Gao mem chen com',
        view: 'http://locvanrice.com/products/contents/gao-mem-chen-com',
        shop: 'http://www.lazada.vn/gao-mem-chen-com-ngon-10-kgs-10579938.html?spm=a2o7f.10605548.0.0.64f164fcZf1bg3'
      },
      thom: {
        title: 'Gạo Thơm VietGAP',
        price: '25,000 VND',
        saleprice: '19,000 VND',
        description: 'Gạo thơm VietGAP Chén cơm là sản phẩm gạo ngon an toàn trong dự án nông nghiệp giữa Gạo Lộc Vân và các hộ nông dân trong hợp tác xã Hòa Hưng xứ Châu Thành tỉnh Đồng Tháp.',
        image: 'http://storage.googleapis.com/singular-pixel-4346/Public/gcc-thom.jpg',
        seo: 'Gao thom VietGAP chen com',
        view: 'http://locvanrice.com/products/contents/gao-thom-vietgap-chen-com',
        shop: 'http://ho.lazada.vn/SHVAKD'
      }
    }
  end

  def website_params
    params.permit(:filter)
  end

end
