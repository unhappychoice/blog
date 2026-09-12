require 'bundler/setup'
require 'net/http'
require 'uri'
require 'time'
require 'json'
require 'active_support'
require 'active_support/core_ext'
require 'octokit'

require_relative './github_article_generator/last_month'
require_relative './github_article_generator/repository'
require_relative './github_article_generator/pull_request'
require_relative './github_article_generator/release'
require_relative './github_article_generator/generator'

article_date = Time.now.in_time_zone('Asia/Tokyo').beginning_of_month.strftime('%Y-%m-%d')
article_path = "#{File.expand_path('../../source/articles', __FILE__)}/#{article_date}-github-activity.html.md"
branch_name = "#{article_date}-github-activity"
article_title = ":+1: Create #{article_date} github activity article automatically"

`git checkout master`
`git pull`
`git checkout -b #{branch_name}`

File.open(article_path, mode = 'w') { |f| f.write(Generator.new.run) }

`git add source`
`git commit -m "#{article_title}"`
`git push --set-upstream origin #{branch_name}`

Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  .create_pull_request('unhappychoice/blog', 'master', branch_name, article_title)
