# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.locvanrice.com"
SitemapGenerator::Sitemap.sitemaps_path = "sitemaps/vi"

SitemapGenerator::Sitemap.create do
  add vabouts_path
  add vproducts_path
  add vblogs_path
  add vmarket_path
  add vcontact_path
  add landing_path
  Content.find_each do |content|
    case content.type
    when "Product"
        add content_path(content, content_type: :products)
    when "About"
        add content_path(content, content_type: :abouts)
    when "Blog"
        add content_path(content, content_type: :blogs)
    end
  end
end
