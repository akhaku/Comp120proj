class Exhibition < ActiveRecord::Base
    validates_presence_of :name
    validates_presence_of :open
    validates_presence_of :close 
    validates_presence_of :description
    validates_presence_of :location
    validates_presence_of :filename
    validates_uniqueness_of :name
    validates_uniqueness_of :filename
end
