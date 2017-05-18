# Admin Content Controller
class ContentsController < ApplicationController
  before_action :set_content, only: %i[show edit update destroy]

  def index
    @contents = Content.where(type: content_type)
  end

  def show; end

  def new
    @content = Content.new(type: content_type)
  end

  def edit; end

  def create
    @content = Content.new(content_params)

    if @contents.save
      redirect_to specific_content_path(@contents), notice: 'Content was success
      fully created.'
    else
      render :new
    end
  end

  def update
    if @content.update(content_params)
      redirect_to specific_content_path(@contents), notice: 'Content was success
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
    @contents = Content.find(params[:id])
  end

  def content_params
    allowed_attrs = %i[id type title category slug published_at tags]
                    .concat(content_type.constantize.content_attributes.keys)
    params.require(:Content).permit(*allowed_attrs)
  end

  def content_type
    @content_type ||= params[:content_type].classify
  end
  helper_method :content_type

end
