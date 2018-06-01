class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :'/index'
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Customer.find_by(id: session[:customer_id]) if session[:customer_id]
    end
    
  end

end