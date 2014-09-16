class Category < ActiveRecord::Base
  belongs_to :kitten

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end