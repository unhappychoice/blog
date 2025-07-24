require 'active_support/all'
require 'fileutils'
require_relative './lib/latex_template'
require_relative './lib/ogp_helper'

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

configure :server do
  activate :livereload
end
