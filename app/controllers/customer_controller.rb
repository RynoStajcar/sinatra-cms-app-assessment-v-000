class CustomerController < ApplicationController

  

  get '/signup' do
    if logged_in?
      redirect to '/customers/show'
    else
    erb :'/customers/signup'
    end
  end

  get '/login' do 
    if logged_in?
      redirect to '/customers/show'
    else
      erb :'/customers/login'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(params)
      session[:customer_id] = @customer.id
      redirect to '/customers'
    end
  end

  post '/login' do
    customer = Customer.find_by(:username => params[:username])
 
    if customer &&customer.authenticate(params[:password])
      session[:customer_id] = customer[:id]
      
      redirect to '/customers'
    else
      redirect to '/login'
    end
  end

  get '/customers' do
    erb :'/customers/show'
  end

  get '/logout' do
    if logged_in?
    session.clear
    redirect to '/login'
    else redirect to '/'
    end
  end

  get '/account' do
    erb :'/customers/account'
  end
  


  end