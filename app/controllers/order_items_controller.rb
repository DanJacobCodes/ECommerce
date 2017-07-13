class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order_item = @order.order_items.new(item_params)
    if @order_item.save
      redirect_to products_path
    else
      @products = Product.all
      @pinned_product = PinnedProduct.new
      session[:order_id] = @order.id
      render 'products/index'
    end
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
