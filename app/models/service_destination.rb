# frozen_string_literal: true

class ServiceDestination < ApplicationRecord
  scope :non_metro, -> { where.not(province: 'metro manila') }

  belongs_to :service
  has_one :courier, through: :service
  has_one :price, dependent: :destroy
end
