# frozen_string_literal: true

# frozen_strpng_literal: true

class QuoteController < ApplicationController
  before_action :quote_params

  def index; end

  def quote
    @prices = PriceService.get_pricing(province_from: quote_params[:province_from],
                                       province_to: quote_params[:province_to])&.sort_by(&:base_rate)
    @from = from_params_concat
    @to = to_params_concat
  end

  private

  def from_params_concat
    "#{quote_params[:address_one_from]} #{quote_params[:address_two_from]} #{quote_params[:city_from]} #{quote_params[:province_from]} #{quote_params[:zip_code_from]} #{quote_params[:country_from]}"
  end

  def to_params_concat
    "#{quote_params[:address_one_to]} #{quote_params[:address_two_to]} #{quote_params[:city_to]} #{quote_params[:province_to]} #{quote_params[:zip_code_to]} #{quote_params[:country_to]}"
  end

  def quote_params
    params.permit(:address_one_from, :address_two_from, :city_from, :province_from, :country_from, :zip_code_from,
                  :address_one_to, :address_two_to, :city_to, :province_to, :country_to, :zip_code_to, :delivery_method, :commit)
  end
end
