# homepage '/' get
#  post for new tweet
#  part2 login/signup get & post

get '/' do
  @tweets = Tweet.all
  @users = User.all
  erb :index
end

post '/' do
  @tweet = Tweet.create(params[:tweet])
  redirect '/'
end

# get '/login' do
# #Bcrypt/Authentication
#   erb :login
#   end

# post
# #Other shit
# redirect '/'
# end
