# frozen_string_literal: true

class AddDestinationToPickup < ActiveRecord::Migration[6.1]
  def change
    add_reference :service_destinations, :service_pickup, foreign_key: true
  end
end
