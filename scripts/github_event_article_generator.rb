require 'bundler/setup'
require 'net/http'
require 'uri'
require 'time'
require 'json'
require 'active_support'
require 'active_support/core_ext'
require 'github_api'

require_relative './github_article_generator/string'
require_relative './github_article_generator/repository'
require_relative './github_article_generator/pull_request'
require_relative './github_article_generator/release'
require_relative './github_article_generator/generator'

output = Generator.new.run

article_date = Time.now.in_time_zone('Asia/Tokyo').beginning_of_month.strftime('%Y-%m-%d')
article_path = "#{File.expand_path('../../source/articles', __FILE__)}/#{article_date}-github-activity.html.md"

File.open(article_path, mode = 'w') { |f| f.write(output) }