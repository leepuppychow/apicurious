class Repo
  attr_reader :id, :name, :language, :star_count, :updated_at

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @language = attributes[:language]
    @star_count = attributes[:stargazers_count]
    @updated_at = attributes[:updated_at]
  end

end
