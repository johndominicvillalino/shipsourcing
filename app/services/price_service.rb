# frozen_string_literal: true

module PriceService
  def self.get_pricing(province_from:, province_to:)
    return [] if province_from.empty? || province_to.empty?

    get_pickup_region = geocode_search(destination: province_from).address['region']

    service_pickups = ServicePickup
                      .includes(:service_destination)
                      .where("province ILIKE '%#{get_pickup_region.strip}%'")
                      .map(&:service_destination)

    return [] if service_pickups.empty?

    service_pickups_ids = service_pickups.flatten

    get_destination_region = geocode_search(destination: province_to).address['region']

    prices = ServiceDestination.includes(:price).includes(:courier).includes(:service).where(id: service_pickups_ids).where("province ILIKE '%#{get_destination_region.strip}%'").map(&:price)

    return outside_metro if prices.empty?

    prices
  end

  def self.geocode_search(destination:)
    result = Geocoder.search(destination.downcase, params: { countrycodes: 'ph' }).first

    return [] unless result

    OpenStruct.new(result.data)
  end

  def self.outside_metro
    Price.outside_metro
  end
end
