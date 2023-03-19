# frozen_string_literal: true

class RemoveCityFromServiceLocation < ActiveRecord::Migration[6.1]
  def change
    remove_column :service_locations, :city
  end
end
