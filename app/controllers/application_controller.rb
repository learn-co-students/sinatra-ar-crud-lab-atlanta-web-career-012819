
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(title: params['title'])
    @article.update(content: params['content'])
    erb :show
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end
  post '/articles' do
    title = params["title"]
    content = params["content"]
    id = Article.create(title: title, content: content).id
    redirect "/articles/#{id}"
  end
end
