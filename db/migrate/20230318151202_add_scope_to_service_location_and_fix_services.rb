# frozen_string_literal: true

class AddScopeToServiceLocationAndFixServices < ActiveRecord::Migration[6.1]
  def change
    add_column :service_locations, :scope, :string
    add_column :services, :delivery_method, :string
    rename_column :services, :rate, :base_rate
    remove_column :services, :deliver_from_scope
    remove_column :services, :deliver_to_scope
    remove_column :services, :deliver_outside_metro
    remove_column :services, :country_code
    remove_column :services, :country
  end
end
