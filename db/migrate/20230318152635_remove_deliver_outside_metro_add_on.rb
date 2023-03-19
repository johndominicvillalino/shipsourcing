# frozen_string_literal: true

class RemoveDeliverOutsideMetroAddOn < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :deliver_outside_metro_add_on
  end
end
