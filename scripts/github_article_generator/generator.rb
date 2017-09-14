require 'erb'

class Generator
  def run
    github = Github.new oauth_token: ENV['GITHUB_TOKEN']

    repositories = github.repos.list('unhappychoice').body
      .select { |e| e['created_at'].prev_month? }
      .map { |e| Repository.new(e) }
      .group_by(&:repository_name)

    events = github.activity.events.list_user_performed('unhappychoice', per_page: 300).body

    pull_requests = events
      .select { |e| e['type'] == 'PullRequestEvent' && e['payload']['action'] == 'opened' }
      .select { |e| e['payload']['pull_request']['created_at'].prev_month? }
      .map { |e| PullRequest.new(e) }
      .group_by(&:repository_name)

    releases = events
      .select { |e| e['type'] == 'CreateEvent' && e['payload']['ref_type'] == 'tag' }
      .select { |e| e['created_at'].prev_month? }
      .map { |e| Release.new(e) }
      .group_by(&:repository_name)

    all_repositories = repositories.merge(pull_requests).merge(releases)
      .keys
      .uniq
      .sort
      .map { |name| repositories[name]&.first || pull_requests[name]&.first&.repository || releases[name]&.first&.repository }

    ERB.new(IO.read(File.expand_path('../template/article.md.erb', __FILE__))).result(binding)
  end
end
