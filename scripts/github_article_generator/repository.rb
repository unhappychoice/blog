class Repository
  attr_reader :title, :created_at, :url

  def initialize(event)
    @title = event['full_name']
    @created_at = event['created_at']
    @url = 'https://github.com/' + @title
  end

  def repository_name
    @title
  end
end
