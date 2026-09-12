class PullRequest
  attr_reader :repository, :title, :created_at, :url

  def initialize(repository_name, pull_request)
    @repository = Repository.new(repository_name)
    @title = pull_request.title
    @created_at = pull_request.created_at
    @url = pull_request.html_url
  end

  def repository_name
    @repository.title
  end

  def to_pretty_s
    "- [#{@title}](#{@url}) (#{LastMonth.format(@created_at)})"
  end
end
