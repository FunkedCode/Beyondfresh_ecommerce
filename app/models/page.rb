# frozen_string_literal: true

class Page < ApplicationRecord
  has_one_attached :image
end
