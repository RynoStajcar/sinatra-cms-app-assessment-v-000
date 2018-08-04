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
      erb :'/'
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
      redirect to '/'
    end
  end

  get '/customers' do
    erb :'/customers/show'
  end

  get '/logout' do
    if logged_in? && current_user.tabulation == nil || current_user.tabulation == 0
    session.clear
    redirect to '/'
    elsif logged_in?
      redirect to '/account'
    else 
      redirect to '/'
    end
  end

  get '/account' do
    if logged_in?
    erb :'/customers/account'
    else
      redirect to '/'
    end
  end

  get '/payment' do
    if logged_in?
    @orders = Order.where(customer_id: current_user.id)
    @orders.each do |order|
      order.destroy
    end
    else
      redirect to '/'
    end
  end  


  end