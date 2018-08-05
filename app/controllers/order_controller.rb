class OrderController < ApplicationController

    get '/order/:id' do
        erb :'/orders/order_list'
    end    

end