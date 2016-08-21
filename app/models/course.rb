class Course < ActiveRecord::Base
  belongs_to :user
  has_many :sections
  has_one :image
  mount_uploader :image2, Image2Uploader

  validates :title, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end
