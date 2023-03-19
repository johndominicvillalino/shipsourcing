# frozen_string_literal: true

class ChangeDeliveryMethodToDeliveryFromScopeAndDeliveryScopeToDeliveryToScope < ActiveRecord::Migration[6.1]
  def change
    rename_column :services, :delivery_method, :deliver_from_scope
    rename_column :services, :delivery_scope, :deliver_to_scope
  end
end
