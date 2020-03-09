require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    "Welcome to Bookmark Manager"
  end

  get '/bookmarks' do
    p @bookmarks = Bookmark.all
    erb(:index)
  end

  run! if app_file == $0
end
