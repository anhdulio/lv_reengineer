# Product is a content
class Product < Content
  #FriendlyId for SEO URL
  extend FriendlyId
  attr_accessor :latest_price, :l7d_price
  content_attr :main_image, :string
  content_attr :spec, :string
  content_attr :usage, :string
  has_many :prices

  def update_product_price
    update_latest_price
    update_l7d_price
  end

  private
  def update_latest_price
    if self.prices.first
      self.latest_price = self.prices.order(updated_date: :desc).first.price
    else
      self.latest_price = 0
    end
  end

  def update_l7d_price
    if self.prices.first
      self.l7d_price = self.prices.where(updated_date: (Time.current - 7.days)..Time.current).average("price")
    else
      self.l7d_price = 0
    end
  end

end
