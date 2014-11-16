# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
player = Player.create(title: "GoGoGarrett", exp: 0, hunts: 20, rubies: 10, level: 1)

# weapons
item1 = Item.find(1)
item2 = Item.find(2)
item3 = Item.find(3)
item4 = Item.find(4)

# armor
item7 = Item.find(7)


player.slots.create(item_id: item1.id, item_type: item1.type)
player.slots.create(item_id: item2.id, item_type: item2.type)

player.inventories.create(item_id: item1.id, item_type: item1.type)
player.inventories.create(item_id: item2.id, item_type: item2.type)
player.inventories.create(item_id: item3.id, item_type: item3.type)
player.inventories.create(item_id: item4.id, item_type: item4.type)

player.inventories.create(item_id: item7.id, item_type: item7.type)
