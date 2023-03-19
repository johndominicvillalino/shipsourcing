# frozen_string_literal: true

class RemoveBaseRateFromService < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :base_rate
  end
end
