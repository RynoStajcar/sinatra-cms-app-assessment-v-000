require 'rack-flash'

class CustomerController < ApplicationController

  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect to '/customers/show'
    else
    erb :'/customers/signup'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "Fill in all fields"
      redirect to '/signup'
    elsif params[:email].include?("@") == false || params[:email].include?(".com") == false
      flash[:message] = "Enter a valid e-mail address"
      redirect to '/signup'
    elsif Customer.find_by_email(params[:email]) == nil
      @customer = Customer.create(params)
      session[:customer_id] = @customer.id
      redirect to '/customers'
    else
      flash[:message] = "Email already taken"
      redirect to '/signup'
    end
  end

  get '/login' do 
    if logged_in?
      redirect to '/customers/show'
    else
      erb :'/'
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
    #if logged_in? && current_user.tabulation == nil || current_user.tabulation == 0
    session.clear
    redirect to '/'
    #elsif logged_in?
    #   flash[:message] = "Please pay your tab first"
    #   redirect to '/account'
    # else 
    #   redirect to '/'
    #end
  end

  get '/account' do
    if logged_in?
    erb :'/customers/account'
    else
      redirect to '/'
    end
  end

  get '/profile/:slug' do
    erb :'/customers/profile'
  end

  end