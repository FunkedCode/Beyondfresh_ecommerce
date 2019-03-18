# frozen_string_literal: true

require 'json'
require 'pp'
require 'faker'

ProductCategory.destroy_all
Category.destroy_all
Product.destroy_all

Dir.foreach('json') do |json_file|
  if json_file.include? '.json'

    product_json = JSON.parse(File.read("json/#{json_file}"))

    price = product_json['price'] == 0.0 ? 1.0 : product_json['price']

    new_product = Product.create(title: product_json['title'],
                                 price: Faker::Commerce.price(range = 0..30.0),
                                 description: product_json['generatedText'],
                                 serving_size: product_json['serving_size'],
                                 ingredient_list: product_json['ingredientList'])
    pp new_product.errors if new_product.errors.count > 0

    product_json['breadcrumbs'].each do |attribute|
      category = Category.find_or_create_by(name: attribute)

      new_product_category = category.product_categories.new(product_name: new_product.title,
                                                             qty: new_product.product_categories.count + 1,
                                                             notes: '')
      new_product_category.product = new_product

      new_product_category.save

      pp new_product_category.errors if new_product_category.errors.count > 0
    end

    pp new_product.categories
  end
end
