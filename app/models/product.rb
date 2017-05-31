# Product is a content
class Product < Content
  #FriendlyId for SEO URL
  extend FriendlyId
  attr_accessor :latest_price, :l7d_price
  content_attr :main_image, :string
  has_many :prices

  def update_product_price
    update_latest_price
    update_l7d_price
  end

  private
  def update_latest_price
    self.latest_price = self.prices.order(updated_date: :desc).first.price
  end

  def update_l7d_price
    self.l7d_price = self.prices.where(updated_date: (Time.current - 7.days)..Time.current).average("price")
  end

end