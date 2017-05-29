# Product is a content
class Product < Content
  content_attr :main_image, :string
  has_many :prices
end