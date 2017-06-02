# Admin Content Controller
class ContentsController < ApplicationController
  include MenuConcern

  before_action :set_content, only: %i[show edit update destroy]
  before_action :set_menubar

  def index
    @contents = Content.where(type: content_type)
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
    @header_info = { title: @content.title, subtitle: @content.short }
    @contact_widget = true
  end

  def new
    @content = Content.new(type: content_type)
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
      redirect_to specific_content_path(@content), notice: 'Content was success
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

  private

  def set_content
    @content = Content.friendly.find(params[:id])
  end

  def content_params
    allowed_attrs = %i[id type title short body category featured locale]
                    .concat(content_type.constantize.content_attributes.keys)
    params.require(:content).permit(*allowed_attrs)
  end

  def content_type
    @content_type ||= params[:content_type].classify
  end
  helper_method :content_type
end
