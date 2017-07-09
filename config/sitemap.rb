%w(locvanrice.net locvanrice.com).each do |domain|
    SitemapGenerator::Sitemap.default_host = "http://#{domain}"
    if domain == 'locvanrice.com'
        SitemapGenerator::Sitemap.sitemaps_path = "sitemaps/vi"
    else
        SitemapGenerator::Sitemap.sitemaps_path = "sitemaps/en"
    end

    SitemapGenerator::Sitemap.create do
        if domain == 'locvanrice.net'
            add eabouts_path
            add eproducts_path
            add eblogs_path
            add emarket_path
            add econtact_path
            Content.locale(:en).find_each do |content|
                case content.type
                when "Product"
                    add content_path(content, content_type: :products)
                when "About"
                    add content_path(content, content_type: :abouts)
                when "Blog"
                    add content_path(content, content_type: :blogs)
                end
            end
        else
            add vabouts_path
            add vproducts_path
            add vblogs_path
            add vmarket_path
            add vcontact_path
            add landing_path
            Content.locale(:vi).find_each do |content|
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
    end
    SitemapGenerator::Sitemap.ping_search_engines
end
