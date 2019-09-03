class Post < ApplicationRecord



  
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? } 

  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyD1-AY1ENg8eR_6of_ZMKKt8MPcVqxyynE")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)

    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end
end

