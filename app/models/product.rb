class Product < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :image_url

  validates_numericality_of :price, greater_than_or_equal_to: 0.01

  validates_uniqueness_of :title

  validates_format_of :image_url, with: /.(png|jpg|gif)\z/,
                                  message: 'must be a gif, png, or jpg format'
end
