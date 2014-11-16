class SetupDatabase < ActiveRecord::Migration
  def change

    create_table :players do |t|
      t.string    :title
      t.integer   :exp,      null: false, default: 0
      t.integer   :hunts,    null: false, default: 0
      t.integer   :rubies,   null: false, default: 0
      t.integer   :level,    null: false, default: 0

      t.timestamps
    end

    create_table :inventories do |t|
      t.integer   :item_id,     null: false
      t.string    :item_type,   null: false
      t.integer   :player_id,   null: false

      t.timestamps
    end

    create_table :slots do |t|
      t.integer   :item_id,     null: false
      t.string    :item_type,   null: false
      t.integer   :player_id,   null: false

      t.timestamps
    end
  end
end
