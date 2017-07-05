# About is a content
class About < Content
  #FriendlyId for SEO URL
  extend FriendlyId
  content_attr :main_image, :string
  content_attr :spec, :string

end
