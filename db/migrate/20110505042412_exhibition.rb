class Exhibition < ActiveRecord::Migration
  def self.up
    create_table :exhibitions do |t|
      t.string   :name
      t.date     :open
      t.date     :close
      t.text     :description
      t.string   :location
      t.string   :image1
      t.string   :image2
      t.string   :image3
      t.string   :image4
      t.string   :image5
      t.time     :opening
      t.string   :filename
      t.time     :opening_end
      
      t.timestamps
    end
  end

  def self.down
    drop_table :exhibitions
  end
end
