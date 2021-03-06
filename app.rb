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
        else
            flash[:error] = "wrong password"
        end
        redirect '/'
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

post '/favorite_businesses' do
  favorite_business = Business.create(business_name: params[:business_name],business_location: params[:business_location],business_phone: params[:business_phone],user_id: session[:user_id])
  businesses = Business.where(user_id: session[:user_id])
  p businesses
  businesses.to_json
end


get '/sign_out' do
    session[:user_id] = nil
    redirect '/'
end
