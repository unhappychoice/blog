class Release
  attr_reader :repository, :tag, :created_at, :url

  def initialize(event)
    @repository = Repository.new(event.repo.name)
    @tag = event.payload.ref
    @created_at = event.created_at
    @url = "https://github.com/#{@repository.title}/releases/tag/#{@tag}"
  end

  def repository_name
    @repository.title
  end

  def to_pretty_s
    "- [#{@tag}](#{@url}) (#{LastMonth.format(@created_at)})"
  end
end
