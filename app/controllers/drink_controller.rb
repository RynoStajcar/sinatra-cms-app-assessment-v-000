class DrinkController < ApplicationController

  get '/drinks/list' do
    erb :'/drinks/list'
  end

  post '/drinks/order' do
    @drink = Drink.find_by_name(params[:drinks].keys[0])
    order = Order.create(customer_id: current_user.id, drink_id: @drink.id)
    redirect to '/account'
  end

  get '/drinks/:slug' do
    erb :'/drinks/drink_page'
  end

end