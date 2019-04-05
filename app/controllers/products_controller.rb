# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products
  # GET /products.json
  def index
    category_search = params[:search].to_s != '' && params[:category_search].to_s != ''
    @products = if category_search
                  Product.joins(:categories)
                         .where('lower(title) LIKE ? and categories.id = ?', "%#{params[:search]}%".downcase, params[:category_search])
                         .distinct.page params[:page]
                elsif params[:search].to_s != ''
                  Product.joins(:categories)
                         .where('lower(title) LIKE ?', "%#{params[:search]}%".downcase)
                         .distinct.page params[:page]
                else
                  Product.all.page params[:page]
                end
    @order_product = current_order.order_products.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @order_product = current_order.order_products.new
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.fetch(:product, {}).permit(:title, :price, :description, :image, :serving_size, :ingredient_list, :order_product_id, product_attribute_id: [])
  end
end
