# frozen_string_literal: true

class Price < ApplicationRecord
  scope :within_metro, -> { where(scope_description: 'within metro manila') }
  scope :outside_metro, -> { where(scope_description: 'outside metro manila') }
  belongs_to :service_destination
end
