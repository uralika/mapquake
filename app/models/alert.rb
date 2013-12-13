class Alert < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true
  validates :street, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  geocoded_by :street
  geocoded_by :state
  geocoded_by :zip 
  after_validation :geocode

  def scrapdef
  	@name = name
  	@street = street
  	@state = state	
  	@zip = zip
  end



end

