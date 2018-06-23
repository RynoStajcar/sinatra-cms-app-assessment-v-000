class DrinkController < ApplicationController

  get '/drinks/list' do
    erb :'/drinks/list'
  end

  post '/drinks/order' do
    @order = params[:drinks]
    erb :'/orders/new'
  end

end