# homepage '/' get
#  post for new tweet
#  part2 login/signup get & post

get '/' do
  @tweets = Tweet.all.reverse
  @users = User.all
  erb :index
end

post '/' do
  Tweet.create(params[:tweet])
  redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(handle: params[:handle])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end
  # authenticate user
  # if user.authenticate, start session with user_id, redirect to main page
  # else redirect to /login
end

get '/register' do
  erb :register
end

post '/register' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect '/'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end

# get '/test' do
#  @follow = current_user.follows.build(:followed_id => params[:followed_id])
#     if @follow.save
#       # flash[:notice] = "You are now following #{@follow.followed.name}"
#       redirect_to user_path(@follow.followed)
#     else
#       # flash[:error] = "Unable to follow."
#       redirect_to user_path(@follow.followed)
#     end
# end
