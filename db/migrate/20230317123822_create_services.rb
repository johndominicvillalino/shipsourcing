# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :delivery_method
      t.float :rate
      t.string :delivery_scope

      t.timestamps
    end
  end
end
