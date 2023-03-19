# frozen_string_literal: true

class RemoveServicePickUpFromPrices < ActiveRecord::Migration[6.1]
  def change
    remove_column :prices, :service_pickup_id
  end
end
