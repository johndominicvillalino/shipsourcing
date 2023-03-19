# frozen_string_literal: true

class ServicePickup < ApplicationRecord
  belongs_to :service
  has_one :courier, through: :service
  has_many :service_destination, dependent: :destroy
  has_one :price, through: :service_destination
end
