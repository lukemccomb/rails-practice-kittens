class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :kitten

  validates :category_id, presence: true
end