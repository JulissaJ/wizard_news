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

  redirect "/"
end

