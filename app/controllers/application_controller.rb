
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/articles/new' do
    erb :new
  end
  post '/articles' do
    title = params["title"]
    content = params["content"]
    Article.create(title: title, content: content)
    redirect "/"
  end
end
