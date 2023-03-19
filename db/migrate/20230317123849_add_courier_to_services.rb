# frozen_string_literal: true

class AddCourierToServices < ActiveRecord::Migration[6.1]
  def change
    add_reference :services, :courier, foreign_key: true
  end
end
