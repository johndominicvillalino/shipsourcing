# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Courier.destroy_all

Courier.create!([
                  { name: 'Lalamove' },
                  { name: 'Grab' },
                  { name: 'J&T Express' },
                  { name: 'LBC' }
                ])

lalamove = Courier.find_by(name: 'Lalamove')
grab = Courier.find_by(name: 'Grab')
jnt_express = Courier.find_by(name: 'J&T Express')
lbc = Courier.find_by(name: 'LBC')

Service.create!([
                  { delivery_method: 'express', courier_id: lalamove.id },
                  { delivery_method: 'express', courier_id: grab.id },
                  { delivery_method: 'standard', courier_id: jnt_express.id },
                  { delivery_method: 'standard', courier_id: lbc.id }
                ])

lalamove_express = lalamove.services.express.first
grab_express = grab.services.express.first
jnt_express_standard = jnt_express.services.standard.first
lbc_standard = lbc.services.standard.first

ServicePickup.create!([
                        { province: 'metro manila', country: 'Philippines', service_id: lalamove_express.id },
                        { province: 'metro manila', country: 'Philippines', service_id: grab_express.id },
                        { province: 'metro manila', country: 'Philippines', service_id: jnt_express_standard.id },
                        { province: 'metro manila', country: 'Philippines', service_id: lbc_standard.id }
                      ])

lalamove_pickup = lalamove_express.service_pickups.first
grab_pickup = grab_express.service_pickups.first
jnt_pickup = jnt_express_standard.service_pickups.first
lbc_pickup = lbc_standard.service_pickups.first

ServiceDestination.create!([
                             { service_pickup_id: lalamove_pickup.id, province: 'metro manila',
                               country: 'Philippines', service: lalamove_express },

                             { service_pickup_id: grab_pickup.id, province: 'metro manila', country: 'Philippines',
                               service: grab_express },

                             { service_pickup_id: jnt_pickup.id,  province: 'metro manila', country: 'Philippines',
                               service: jnt_express_standard },

                             { service_pickup_id: lbc_pickup.id, province: 'metro manila', country: 'Philippines',
                               service: lbc_standard },
                             { service_pickup_id: jnt_pickup.id, province: '', country: 'Philippines',
                               service: jnt_express_standard },
                             { service_pickup_id: lbc_pickup.id, province: '', country: 'Philippines',
                               service: lbc_standard }
                           ])

Price.create!([
                { base_rate: 100,
                  service_destination: lalamove_express.service_destinations.first, scope_description: 'within metro manila' },

                { base_rate: 120, service_destination: grab_express.service_destinations.first,
                  scope_description: 'within metro manila' },

                { base_rate: 80,
                  service_destination: jnt_express_standard.service_destinations.first, scope_description: 'within metro manila' },

                { base_rate: 100, service_destination: lbc_standard.service_destinations.first,
                  scope_description: 'within metro manila' },

                { base_rate: 100, service_destination: jnt_express_standard.service_destinations.last,
                  scope_description: 'outside metro manila' },

                { base_rate: 120,
                  service_destination: lbc_standard.service_destinations.last, scope_description: 'outside metro manila' }
              ])

p "#{Courier.count} total couriers created!"
p "#{Service.count} total services created!"
p "#{ServicePickup.count} total service pickup created!"
p "#{ServiceDestination.count} total service destination created!"
p "#{Price.count} total prices created!"
