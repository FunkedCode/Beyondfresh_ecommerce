# frozen_string_literal: true

require 'json'
require 'pp'
require 'faker'
require 'open-uri'

OrderProduct.destroy_all
Order.destroy_all
ProductCategory.destroy_all
Category.destroy_all
Product.destroy_all
OrderStatus.destroy_all

OrderStatus.create! id: 1, name: 'In Progress'
OrderStatus.create! id: 2, name: 'Placed'
OrderStatus.create! id: 3, name: 'Shipped'
OrderStatus.create! id: 4, name: 'Cancelled'

Dir.foreach('json') do |json_file|
  if json_file.include? '.json'

    product_json = JSON.parse(File.read("json/#{json_file}"))

    price = product_json['price'] == 0.0 ? 1.0 : product_json['price']

    file_found = true
    begin
      file = open(product_json['images'][1])
    rescue Net::OpenTimeout
      file_found = false
    end

    new_product = Product.new(title: product_json['title'],
                              price: Faker::Commerce.price(range = 0..12.0),
                              description: product_json['generatedText'],
                              serving_size: product_json['serving_size'],
                              ingredient_list: product_json['ingredientList'],
                              image: file)

    if file_found
      new_product.image.attach(io: file, filename: "temp.#{file.content_type_parse.first.split('/').last}", content_type: file.content_type_parse.first)
      sleep(rand(10))
    end

    new_product.save

    pp new_product.errors if new_product.errors.count > 0

    crumb_count = 1
    current_main_category = nil

    product_json['breadcrumbs'].reverse_each do |attribute|
      is_main_category = crumb_count == 1

      if is_main_category
        category = Category.find_or_create_by!(name: attribute, is_main_category: is_main_category)
        current_main_category = category
      else
        category = current_main_category.children.find_or_create_by(name: attribute, is_main_category: is_main_category)
      end

      new_product_category = category.product_categories.new(product_name: new_product.title,
                                                             qty: new_product.product_categories.count + 1,
                                                             notes: '')
      new_product_category.product = new_product

      new_product_category.save

      pp new_product_category.errors if new_product_category.errors.count > 0

      pp "#{crumb_count} loop count"
      pp attribute
      crumb_count += 1
    end

  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
