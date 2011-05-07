class Artwork < ActiveRecord::Base
  attr_accessor :imglink
  

  validates :title, :presence => true
  validates :creator, :presence => true
  validates :description, :presence => true
  #validates :location, :presence => true
  #validates :thumbnail, :presence => true
  validates_uniqueness_of :title

  has_many :tour_items
  has_many :tour, :through => :tour_items
  # This is for getting all pieces where the field is exactly
  # the value parameter. e.g., type = 'artist',
  #                            value = 'Pearce, Charles Sprague' 
  def self.filter_by(type, value)
    if type == 'artist'
      type = 'creator'
    elsif type == 'donor'
      type = 'recfrom'
    end

    Artwork.where("#{type} = ?", value)
  end
  
  def self.search(search, field = "all", order_by = "title")
    if search
      if field == "all"
        where({ :title.like => "%" + search + "%" } \
              | { :object.like => search } \
              | { :creator.like => search  } \
              | { :recfrom.like => search } \
              | { :location.like => search } \
              | { :description.like => "%" + search + "%" }).order(order_by.to_sym.asc)
      else
        where({ (field.to_sym).like => "%" + search + "%" })
      end
    else
      scoped
    end
  end
end