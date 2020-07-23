class UsersController < ApplicationController
  use Rack::Flash

  get '/users' do
    require_logged_in

    @users = User.all
    
    if @users
      erb :'users/index'
    else
      flash[:alert] = "Cannot find this user"

    end
  end

  get '/users/:id' do
    require_logged_in
    @user = User.find_by(id: params[:id])
    if @user
      erb :'users/show'
    else
      flash[:alert] = "Cannot find this user"
      redirect '/users'
    end
  end

  delete '/users/:id' do
    require_logged_in
    user = User.find_by(id: params[:id])
    # raise movie.inspect
    if user
      flash[:info] = "'#{user.username}' has been successfully deleted"
      user.delete
    else
      flash[:alerte] = "Cannot delete this unknown user"
    end
    redirect '/users'
  end

  get '/signup' do
    @active_signup = 'active'
    redirect to '/movies' if logged_in?
    @user = User.new
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.new params[:user]

    if @user.save
      session[:user_id] = @user.id
      # Pony.mail(
      #   to: 'noreply@myapp.com',
      #   from: "phonglt@gmail.com",
      #   subject: "MyApp Account Verification",
      #   body: "account create successfull"
      # )
      flash[:info] = "You've been successfully registered"
      redirect '/movies'
    else
      erb :'users/signup'
    end
  end

  get '/login' do
    @active_signin = 'active'
    redirect to '/movies' if logged_in?
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by username: params[:user][:username]
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect '/movies'
    else
      flash[:msg] = "The username or password did not match our records. Please try again"
      redirect '/login'
    end
  end

  post '/logout' do
    session.clear if logged_in?
    redirect to '/'
  end
end
