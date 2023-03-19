# frozen_string_literal: true

class AddFKtoServiceLocation < ActiveRecord::Migration[6.1]
  def change
    add_reference :service_locations, :service, foreign_key: true
  end
end
