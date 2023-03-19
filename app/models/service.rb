# frozen_string_literal: true

class Service < ApplicationRecord
  scope :standard, -> { where(delivery_method: 'standard') }
  scope :express, -> { where(delivery_method: 'express') }

  belongs_to :courier
  has_many :service_pickups, dependent: :destroy
  has_many :service_destinations, dependent: :destroy
  has_many :prices, through: :service_pickups
  has_many :prices, through: :service_destinations
end
