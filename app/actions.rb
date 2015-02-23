# Homepage (Root path)
def check_login(request)
  redirect '/login' unless @user
end

get '/' do
  check_login(request)
  erb :index
end

get '/signup' do
  @user = User.new
  erb :'signup'
end

get '/login' do
  @user = User.new
  erb :'login'
end

get '/logout' do
  @user = nil
  redirect '/login'
end

get '/songs/?' do
  @songs = SongSubmission.all
  erb :'songs/index'
end

get '/songs/new' do
  check_login(request)
  @song = SongSubmission.new
  erb :'songs/new'
end

get '/songs/:id' do
  check_login(request)
  @song = SongSubmission.find(params[:id])
  erb :'songs/show'
end

post '/signup' do
  @user = User.new(email: params[:email],
                   password: params[:password])
  if @user.save
    redirect '/songs'
  else
    redirect '/signup'
  end
end

post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])
  if @user
    redirect '/songs'
  else
    redirect '/login'
  end
end

post '/songs' do
  check_login(request)
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
