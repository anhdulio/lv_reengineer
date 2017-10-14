# Admin Content Controller
class ContentsController < ApplicationController
  include MenuConcern

  before_action :set_content, only: %i[show edit update destroy]
  before_action :set_menubar
  before_action :authenticate_admin!, except: %i[show api]

  def index
    @contents = Content.where(type: contents_type).order(:locale)
  end

  def update_price
    prices = params[:prices]
    exrate = params[:exrate]
    prices.each do |id, price|
      product = Product.find(id)
      price = Price.new(updated_date: DateTime.now, price: price, exchange_rate: exrate, product: product)
      price.save
    end
    redirect_to contents_path(:product), notice: "Prices have been updated"
  end

  def show
    #@header_info = { title: @content.title, subtitle: @content.short }
    @intendbox = true
    if @content.publish?
      @meta_title = @content.title
      @meta_description= @content.short
      @header_info = { title: @content.title, subtitle: '' }
      @contact_widget = true
    else
      render file: "#{Rails.root}/public/404"
    end
    breadcrumb1 = Breadcrumb.new(root_url, t('website.breadcrumb.home'), "1")
    breadcrumb2 = Breadcrumb.new("http://#{request.host}#{@menubar[:menu][:abouts][:url]}", @menubar[:menu][:abouts][:title], "2")
    breadcrumb3 = Breadcrumb.new(content_url(contents_type, @content), @content.title , "3")
    @breadcrumbs = [breadcrumb1, breadcrumb2, breadcrumb3]
  end

  def new
    @content = Content.new(type: contents_type)
  end

  def edit; end

  def create
    @content = Content.new(content_params)

    if @content.save
      redirect_to specific_content_path(@content), notice: 'Content was success
      fully created.'
    else
      render :new
    end
  end

  def update
    if @content.update(content_params)
      redirect_to specific_contents_path, notice: 'Content was success
      fully updated.'
    else
      render :edit
    end
  end

  def destroy
    @content.destroy
    redirect_to specific_contents_path, notice: 'Content was successfully destro
    yed.'
  end

  def api
    values = Content.get_values(params[:attribute], contents_type)
    render json: values
  end

  private

  def set_content
    @content = Content.friendly.find(params[:id])
    if @content.type == "Product"
      @content.update_product_price
      @ex = { latest: Price.get_latest_exchange, l7d: Price.get_l7d_exchange }
    end
  end

  def content_params
    allowed_attrs = %i[id type title short body category_id featured locale published_at]
                    .concat(contents_type.constantize.content_attributes.keys)
    params.require(:content).permit(*allowed_attrs)
  end

  def contents_type
    @content_type ||= params[:content_type].classify
  end
  helper_method :content_type
end
