class ProductsController < ActionController::Base

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end
  def new
    @product = Product.new
    if @product.save
      render :index
    else
      render :new
    end
  end
end
