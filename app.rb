require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'
require 'pry'


class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'page working!'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks/:id' do
    flash[:notice] = "You must enter a valid URL" unless Bookmark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  post '/bookmarks/:id/delete' do
    Bookmark.delete(id: params['id'])
    redirect '/bookmarks'
  end

  get '/bookmarks/edit' do
    @id = params['id']
    p @id
    erb :"/bookmarks/edit"
  end

  post '/booksmarks/edit1' do
    Bookmark.edit(id: params['id'], url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  run! if app_file ==$0
end
