# frozen_string_literal: true

class RenameServiceLocationToServicePickUp < ActiveRecord::Migration[6.1]
  def change
    rename_table :service_locations, :service_pickups
  end
end
