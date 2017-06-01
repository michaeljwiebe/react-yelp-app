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
            session[:user_id] = user.id
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

post '/favorite_businesses' do
  p params
  favorite_business = Business.create(business_name: params[:business_name],business_location: params[:business_location],business_phone: params[:business_phone],user_id: session[:user_id])
  p favorite_business
  favorite_business.to_json
end
