# frozen_string_literal: true

ActiveAdmin.register ProductCategory do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :product_name, :qty, :notes, :id, :category_id, :product_id
end
