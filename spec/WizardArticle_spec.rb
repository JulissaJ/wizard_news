require 'rspec'
require_relative '../lib/WizardArticle'

describe WizardArticle do
it 'has a article title' do
  x = WizardArticle.new('title', 'url', 'description')
  expect(x.title).to eq('title')
end

it 'has a url' do
x = WizardArticle.new('hprules', 'www.hp.com', 'wow, so cool')
expect(x.url).to eq('www.hp.com')
end

it 'has a description' do
  x = WizardArticle.new('article name', 'pottermore.com', 'dumbledore dies!')
  expect(x.description).to eq('dumbledore dies!')
end


it 'imports articles' do
end
# it 'has a URL' do
#   x = WizardArticle.new('')


# end