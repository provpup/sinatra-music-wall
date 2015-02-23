# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs/?' do
  @songs = SongSubmission.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = SongSubmission.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = SongSubmission.find(params[:id])
  erb :'songs/show'
end

post '/songs' do
  @song = SongSubmission.new(
    title: params[:title],
    url: params[:url],
    author: params[:author]
    )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end