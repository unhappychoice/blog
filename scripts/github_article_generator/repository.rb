class Repository
  attr_reader :title, :created_at, :url

  def initialize(title, created_at = nil)
    @title = title
    @created_at = created_at
    @url = "https://github.com/#{title}"
  end

  def repository_name
    @title
  end
end
