# frozen_string_literal: true

class CreateServiceLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :service_locations do |t|
      t.string :province
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
