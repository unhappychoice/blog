xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom", "xmlns:media" => "http://search.yahoo.com/mrss/" do
  site_url = "https://blog.unhappychoice.com"
  xml.title "unhappychoice.com"
  xml.subtitle "unhappychoiceの日常やプログラミングなど"
  xml.id URI.join(site_url, blog.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, blog.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.updated(blog.articles.first.date.to_time.iso8601) unless blog.articles.empty?
  xml.author { xml.name "Blog Author" }

  blog.articles[0..19].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Article Author" }

      # Add OGP image (same logic as ogp_helper.rb)
      image_url = if article.data.image
        URI.join(site_url, "/images#{article.data.image}")
      elsif article.path.start_with?("articles/") && article.title
        ogp_path = article.path.gsub(/\.html$/, '.png').gsub(/^articles\//, '')
        URI.join(site_url, "/images/ogp/#{ogp_path}")
      end
      xml.tag!("media:content", "url" => image_url, "medium" => "image") if image_url
      xml.tag!("media:thumbnail", "url" => image_url, "width" => "1200", "height" => "630") if image_url

      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
