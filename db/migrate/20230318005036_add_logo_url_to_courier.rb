# frozen_string_literal: true

class AddLogoUrlToCourier < ActiveRecord::Migration[6.1]
  def change
    add_column :couriers, :logo_url, :string
  end
end
