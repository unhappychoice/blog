require 'active_support/all'
require 'fileutils'
require_relative './lib/latex_template'
require_relative './lib/ogp_helper'
require_relative './lib/ogp_generator'

helpers OgpHelper

Tilt.register LatexTemplate, 'math'

Time.zone = 'Tokyo'

set :markdown_engine, :redcarpet
set :markdown, tables: true, autolink: true, gh_blockcode: true, fenced_code_blocks: true, footnotes: true, no_intra_emphasis: true
set :relative_links, true

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/feed.xml", layout: false

activate :syntax

activate :blog do |blog|
  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.sources = "articles/{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "blog"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :gzip
  activate :minify_html
end

# ビルド後にOGP画像を生成する
after_build do |builder|
  sitemap.resources.each do |resource|
    # 記事ページのみを対象とする
    if resource.path.start_with?('articles/') && resource.data.title
      # OGP画像のファイル名を決定 (例: 記事のパスから拡張子を除いて .png を付加)
      ogp_image_name = resource.path.gsub(/\.html$/, '.png').gsub(/^articles\//, '')
      output_dir = File.join(config[:build_dir], 'images', 'ogp')
      FileUtils.mkdir_p(output_dir) unless File.exist?(output_dir)
      output_path = File.join(output_dir, ogp_image_name)

      # OgpGenerator を呼び出して画像を生成
      OgpGenerator.generate_ogp_image(resource.data.title, output_path)
    end
  end
end

configure :server do
  activate :livereload
end
