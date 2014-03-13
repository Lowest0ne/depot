# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all


[
  { title: 'Chicken Egg',
    description: 'Farm Fresh Eggs.  These eggs will make you <em>live</em>.',
    image_url: 'chicken_egg.jpg',
    price: 0.25
  },
  { title: 'Raw Chicken',
    description: 'Well, at least <em>you</em> get to live',
    image_url: 'chicken_raw.jpg',
    price: 25.00
  },
  {
    title: 'Chicken Wire',
    description: 'We have some of this stuff left over',
    image_url: 'chicken_wire.jpg',
    price: 10.00
  }
].each do | product |
  Product.create( product )
end
