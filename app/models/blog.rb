class Blog < Content
  #FriendlyId for SEO URL
  extend FriendlyId

  content_attr :main_image, :string
end