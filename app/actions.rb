# Homepage (Root path)
set sessions: true

register do
  def auth (type)
    condition do
      redirect "/login" unless send("is_#{type}?")
    end
  end
end

helpers do
  def is_user?
    session[:user_id]
  end
end

get '/', auth: :user do
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
  session[:user_id] = nil
  redirect '/login'
end

get '/songs/?' do
  @songs = SongSubmission.all
  if (session[:user_id])
    @user = User.find(session[:user_id])
  else
    @user = User.new
  end
  erb :'songs/index'
end

get '/songs/new', auth: :user do
  @song = SongSubmission.new
  erb :'songs/new'
end

get '/songs/:id', auth: :user do
  @song = SongSubmission.find(params[:id])
  erb :'songs/show'
end

get '/upvote', auth: :user do
  @song = SongSubmission.find(params[:song])
  Upvote.create(user_id: session[:user_id], song_submissions_id: @song.id) if @song

  redirect '/songs'
end

post '/signup' do
  @user = User.new(email: params[:email],
                   password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs'
  else
    redirect '/signup'
  end
end

post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/songs'
  else
    redirect '/login'
  end
end

post '/songs', auth: :user do
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
