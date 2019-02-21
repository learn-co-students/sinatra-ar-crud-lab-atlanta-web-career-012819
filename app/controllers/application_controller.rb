
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article = Article.create(title: params["title"], content: params["content"])
    redirect "/articles/#{article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params["id"])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params["id"])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by(id: params["id"])
    params.delete("_method")
    params.delete("submit")
    if @article.update(params)
      redirect "/articles/#{@article.id}"
    else
      erb :edit
    end
  end

  delete '/articles/:id/delete' do
    Article.destroy(params[:id])
    redirect '/articles'
  end

end
