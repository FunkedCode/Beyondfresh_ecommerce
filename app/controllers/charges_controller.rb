# frozen_string_literal: true

class ChargesController < ApplicationController
  def new; end

  def create
    complete_order

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def complete_order
    @order = current_order

    @order.order_status_id = 2
    @order.total = @order.subtotal + @order.shipping + @order.tax
    @order.save

    session[:order_id] = nil

    @amount = (@order.total * 100).to_i
  end
end
