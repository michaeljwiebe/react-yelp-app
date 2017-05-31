get '/' do
    erb :index
end

get '/profile' do
    erb :profile
end

post '/signin' do
    if User.where(username: params[:username]) != []
        user = User.where(username: params[:username]).first
        if user.password == params[:password]
            flash[:notice] = "success"
            sessions[:user_id] = user.id
            redirect '/business_finder'
        else
            flash[:error] = "wrong password"
            redirect '/'
        end
    end
end

post '/signup' do
    user = User.new(params[:user])
    if user.save
        flash[:notice] = "success"
        redirect '/profile'
    else
        flash[:error] = user.errors.full_messages
        redirect '/'
    end
end

get '/business_finder' do
  erb :business_finder
end
