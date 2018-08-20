class OrderController < ApplicationController

    get '/order/:id' do
        erb :'/orders/order_list'
    end    

    get '/payment' do
        if logged_in?
        @orders = Order.where(customer_id: current_user.id)
        @orders.each do |order|
          order.destroy
        end
          redirect to '/account'
        else
          redirect to '/'
        end
      end  

end