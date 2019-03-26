# frozen_string_literal: true

class OrderProductsController < ApplicationController
  def create
    @order = current_order
    @order_product = @order.order_products.new(order_product_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_product = @order.order_products.find(params[:id])
    @order_product.update_attributes(order_product_params)
    @order_products = @order.order_products
   end

  def destroy
    @order = current_order
    @order_product = @order.order_products.find(params[:id])
    @order_product.destroy
    @order_products = @order.order_products
  end

  private

  def order_products_params
    params.require(:order_product).permit(:qty, :product_id)
  end
end
