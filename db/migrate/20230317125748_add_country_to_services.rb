# frozen_string_literal: true

class AddCountryToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :country, :string, default: 'Philippines'
    add_column :services, :country_code, :string, default: 'PH'
  end
end
