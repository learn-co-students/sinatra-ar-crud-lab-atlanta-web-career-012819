
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get "/articles" do
    @articles = Articles.all
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
    binding.pry
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end
  post '/articles' do
    title = params["title"]
    content = params["content"]
    Article.create(title: title, content: content)
    redirect "/"
  end
end
