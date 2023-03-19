# frozen_string_literal: true

class CreateServiceDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :service_destinations do |t|
      t.string :province
      t.string :country
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
