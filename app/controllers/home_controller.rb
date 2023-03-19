# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @couriers = Courier.all
    @service_pickups_locations = PhilLocator::Province.all.map(&:name).sort.select do |province|
      province if province.include?('NCR')
    end
    @provinces = PhilLocator::Province.all.map(&:name).sort
  end
end
