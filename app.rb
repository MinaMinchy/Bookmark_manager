require 'sinatra/base'
require_relative './lib/bookmark'

class Bookmarks < Sinatra::Base

  get '/' do
    "Bookmark Manager!"
  end

  get '/bookmarks' do
    # p ENV
    @bookmarks = Bookmark.all

    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'
  end


# start the server if ruby file executed directly
  run! if app_file == $0
end
