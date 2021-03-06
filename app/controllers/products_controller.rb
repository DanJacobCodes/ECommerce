class ProductsController < ApplicationController
  before_action :only => [:new] do
  redirect_to new_user_session_path unless current_user && current_user.admin
  end


  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @pinned_product = PinnedProduct.new
  end

  def new
    @products = Product.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product added succesfully!"
      respond_to do |format|
        format.html
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if  OrderItem.find_by(:product_id => @product.id)
      @order_item = OrderItem.find_by(:product_id => @product.id)

      @order_item.destroy
    end
    if PinnedProduct.find_by(:product_id => @product.id)
      @pinned_product = PinnedProduct.find_by(:product_id => @product.id)
      @pinned_product.destroy
    end
    @product.destroy
    @order_items = OrderItem.all
    @order_item.update_total

    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end


  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
