class Generator
  def run
    repositories = JSON.parse(request('https://api.github.com/users/unhappychoice/repos?per_page=300&sort=updated').body)
      .select { |e| e['created_at'].prev_month? }
      .map { |e| Repository.new(e) }
      .group_by(&:repository_name)

    events = JSON.parse(request('https://api.github.com/users/unhappychoice/events?per_page=300').body)

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

    string = repositories.merge(pull_requests).merge(releases)
      .keys
      .uniq
      .sort
      .map { |name| repositories[name]&.first || pull_requests[name]&.first&.repository || releases[name]&.first&.repository }
      .map { |r| repository_string(r,pull_requests[r.title] || [],releases[r.title] || []) }
      .join("\n")

    <<-"EOS"
---
title: My Github activity in #{Time.now.in_time_zone('Asia/Tokyo').prev_month.strftime('%Y / %m')}
tags: github
---

READMORE

#{string}
    EOS
  end

  private

  def request(url)
    header = { 'Authorization' => "token #{ENV['GITHUB_TOKEN']}" }
    uri = URI.parse(url)

    Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request_get(uri, header)
    end
  end

  def pull_requests_string(pull_requests)
    return '' if pull_requests.empty?
    "##### 📁　Pull requests\n" + pull_requests.map(&:to_pretty_s).join("\n") + "\n"
  end

  def release_string(releases)
    return '' if releases.empty?
    "##### 🎉　Releases\n" + releases.map(&:to_pretty_s).join("\n") + "\n"
  end

  def repository_string(repository, pull_requests, releases)
    <<-EOS
### [#{repository.title}](#{repository.url})
#{"\n- 🎉　Created repository (#{repository.created_at.to_time_string})" if pull_requests.empty? && releases.empty?}
#{pull_requests_string(pull_requests)}
#{release_string(releases)}
    EOS
  end
end
