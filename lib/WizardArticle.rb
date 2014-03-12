class WizardArticle
  def initialize(title, url, description)
    @title = title
    @url = url
    @description = description
end

  def title
    @title
  end

  def url
    @url
  end

  def description
    @description
  end

  def write_to_csv(file)
    CSV.open(file) do row
      row << ['title', 'url', 'description']
    end
  end

end