class Post < ApplicationRecord

  has_many :comments, dependent: :destroy

  has_one_attached :image

  belongs_to :user
  belongs_to :prefecture

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true
  validates :address, presence: true
  validates :image, presence: true
  

  


  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? } 
  


  private
  def geocode
      uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=ENV['GMAP_API_KEY']")
      res = HTTP.get(uri).to_s
      response = JSON.parse(res)


      self.latitude ||= response["results"][0]["geometry"]["location"]["lat"]
      self.longitude ||= response["results"][0]["geometry"]["location"]["lng"]
  end
end

