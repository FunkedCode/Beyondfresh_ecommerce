# frozen_string_literal: true

class OrderProductsController < ApplicationController
  before_action :set_customer, on: %i[update create]

  def set_customer
    if current_customer.nil?
      flash[:warning] = 'Please Login first.'
      redirect_back(fallback_location: root_path)
    else
      @order = if current_customer.orders.where(order_status_id: 1).count > 0
                 current_customer.orders.where(order_status_id: 1).first
               else
                 current_order
               end
      @order.customer_id = current_customer.id
    end
  end

  def create
    @order_product = @order.order_products.new(order_product_params)
    @order.tax = 0.12
    @order.shipping = 2.00
    @order.order_status_id = 1
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order_product = @order.order_products.find(params[:id])
    @order_product.update_attributes(order_product_params)
    @order_products = @order.order_products
    @order.save
  end

  def destroy
    @order = current_order
    @order_product = @order.order_products.find(params[:id])
    @order_product.destroy
    @order_products = @order.order_products
    @order.save
  end

  private

  def order_product_params
    params.require(:order_product).permit(:qty, :product_id, :unit_price)
  end
end
