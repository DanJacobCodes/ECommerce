class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items

    @pinned_products = PinnedProduct.all


  end

  def order_complete
    current_order.update(:status => "NO REFUNDS, ORDER HAS BEEN SENT")
    session[:order_id] = nil
    redirect_to cart_path
  end

end
