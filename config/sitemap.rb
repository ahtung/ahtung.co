SitemapGenerator::Sitemap.default_host = 'https://www.ahtung.co'
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new
SitemapGenerator::Sitemap.sitemaps_host = ENV['CDN']
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.create do
  # Root
  add '/', changefreq: 'daily', priority: 1.0
end
