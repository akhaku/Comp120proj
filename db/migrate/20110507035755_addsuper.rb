class Addsuper < ActiveRecord::Migration
  def self.up
			 add_column :users, :issuper, :boolean
  end

  def self.down
			 remove_column :users, :issuper
  end
end
