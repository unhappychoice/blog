require 'erb'
require 'octokit'

USER = 'unhappychoice'.freeze

class Generator
  def run
    repositories = created_repositories.group_by(&:repository_name)
    pull_requests = opened_pull_requests.group_by(&:repository_name)
    releases = created_releases.group_by(&:repository_name)

    all_repositories = (repositories.keys + pull_requests.keys + releases.keys)
      .uniq
      .sort
      .map { |name| repositories[name]&.first || pull_requests[name]&.first&.repository || releases[name]&.first&.repository }

    ERB.new(IO.read(File.expand_path('../template/article.md.erb', __FILE__))).result(binding)
  end

  private

  def created_repositories
    client.repositories(USER, per_page: 100)
      .select { |repo| LastMonth.cover?(repo.created_at) }
      .select { |repo| repo.full_name.include?(USER) }
      .map { |repo| Repository.new(repo.full_name, repo.created_at) }
  end

  # The events API only exposes a stripped down pull request payload, so the
  # title and the html url have to be fetched for each opened pull request.
  def opened_pull_requests
    last_month_events('PullRequestEvent')
      .select { |event| event.payload.action == 'opened' }
      .map { |event| PullRequest.new(event.repo.name, fetch_pull_request(event)) }
  end

  def created_releases
    last_month_events('CreateEvent')
      .select { |event| event.payload.ref_type == 'tag' }
      .map { |event| Release.new(event) }
  end

  def fetch_pull_request(event)
    client.pull_request(event.repo.name, event.payload.number)
  end

  def last_month_events(type)
    events
      .select { |event| event.type == type }
      .select { |event| LastMonth.cover?(event.created_at) }
  end

  def events
    @events ||= client.user_public_events(USER, per_page: 100)
  end

  def client
    @client ||= Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'], auto_paginate: true)
  end
end
