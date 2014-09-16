class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :kitten

  validates :category_id, presence: true
  validates_uniqueness_of :category_id, :scope => :kitten_id
end