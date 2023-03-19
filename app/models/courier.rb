# frozen_string_literal: true

class Courier < ApplicationRecord
  has_many :services, dependent: :destroy
  has_many :service_pickups, through: :services
  has_many :service_destinations, through: :service
end
