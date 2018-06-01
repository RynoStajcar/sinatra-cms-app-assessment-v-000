class DrinkController < ApplicationController

  get '/drinks/list' do
    erb :'/drinks/list'
  end

end
