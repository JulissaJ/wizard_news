require 'sinatra'
require 'shotgun'
require 'csv'
require_relative 'lib/WizardArticle'


get "/" do
  @articles = []
  CSV.foreach('articles.csv') do |row|
    @articles << WizardArticle.new(row[0], row[1], row[2])
  end

  erb :index
end


get "/createarticle" do
erb :createarticle
end

post "/createarticle" do
  @article = WizardArticle.new(
    params['title'],
    params['url'],
    params['description']
    )

  CSV.open('articles.csv', 'a') do |file|
    file << ["#{@article.title}", "#{@article.url}", "#{@article.description}"]
  end



  #create a wizard based on form values
  # @article = WizardArticle.new(title, url, description)
  # @article.write_to_csv(file)

  redirect "/"
end


# CSV.open('articles.csv', 'a') do |csv|
#   csv << [@article]
# end
# end