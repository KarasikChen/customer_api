# frozen_string_literal: true
class User < ApplicationRecord
  include Authentication
  has_many :customers
  has_many :items
end
