class PinnedProductsController < ApplicationController

  def show
    @order_items = current_order.order_items
  end

  def create
    @pinned_product = PinnedProduct.new(pinned_product_params)
    @pinned_product.save
    redirect_to products_path
    end

  def destroy
    @pinned_product = PinnedProduct.find(params[:id])
  end

  private

  def pinned_product_params
    params.require(:pinned_product).permit(:product_id, :user_id)
  end
end
