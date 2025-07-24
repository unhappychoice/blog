module OgpHelper
  def ogp_tags
    tags = {
      "og:title" => ogp_title,
      "og:type" => ogp_type,
      "og:url" => ogp_url,
      "og:image" => ogp_image,
      "og:description" => ogp_description,
      "twitter:card" => "summary_large_image",
      "twitter:site" => "@unhappychoice",
      "twitter:title" => ogp_title,
      "twitter:description" => ogp_description,
      "twitter:image" => ogp_image,
    }

    tags.map do |property, content|
      if property.start_with?("twitter:")
        tag(:meta, name: property, content: content)
      elsif content
        tag(:meta, property: property, content: content)
      end
    end.join("\n")
  end

  private

  def ogp_title
    if current_page.data.title
      "#{current_page.data.title} - blog.unhappychoice.com"
    else
      "blog.unhappychoice.com"
    end
  end

  def ogp_type
    if current_page.path.start_with?("articles/")
      "article"
    else
      "website"
    end
  end

  def ogp_url
    "https://blog.unhappychoice.com/#{current_page.path}"
  end

  def ogp_image
    if current_page.data.image
      "https://blog.unhappychoice.com/images#{current_page.data.image}"
    elsif current_page.path.start_with?("articles/") && current_page.data.title
      # 自動生成されたOGP画像のパスを返す
      # 例: /images/ogp/2025-07-25-test-article.png
      "https://blog.unhappychoice.com/images/ogp/#{current_page.path.gsub(/\.html$/, '.png').gsub(/^articles\//, '')}"
    else
      nil
    end
  end

  def ogp_description
    current_page.data.description || "A blog by unhappychoice"
  end
end
