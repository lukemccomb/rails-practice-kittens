class Kitten < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :image, presence: true

end