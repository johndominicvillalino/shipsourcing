# frozen_string_literal: true

class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.float :base_rate
      t.references :service_pickup, null: false, foreign_key: true
      t.references :service_destination, null: false, foreign_key: true
      t.string :scope_description

      t.timestamps
    end
  end
end
