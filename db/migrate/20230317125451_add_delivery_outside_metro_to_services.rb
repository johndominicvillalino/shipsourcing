# frozen_string_literal: true

class AddDeliveryOutsideMetroToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :deliver_outside_metro, :boolean
    add_column :services, :deliver_outside_metro_add_on, :float
  end
end
