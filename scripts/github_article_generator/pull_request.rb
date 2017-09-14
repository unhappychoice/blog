class PullRequest
  attr_reader :repository, :title, :created_at, :url

  def initialize(event)
    pull_request = event['payload']['pull_request']
    @repository = Repository.new(pull_request['base']['repo'])
    @title = pull_request['title']
    @created_at = pull_request['created_at']
    @url = pull_request['html_url']
  end

  def repository_name
    @repository.title
  end

  def to_pretty_s
    "- [#{@title}](#{@url}) (#{@created_at.to_time_string})"
  end
end