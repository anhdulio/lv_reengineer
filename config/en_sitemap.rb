# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.locvanrice.net"
SitemapGenerator::Sitemap.sitemaps_path = "sitemaps/en"

SitemapGenerator::Sitemap.create do
  add eabouts_path
  add eproducts_path
  add eblogs_path
  add emarket_path
  add econtact_path
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
