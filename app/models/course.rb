class Course < ApplicationRecord
  has_many :tutors, dependent: :destroy
  
  validates_uniqueness_of :name, case_sensitive: false  
  validates :name, :description,  presence: true

  accepts_nested_attributes_for :tutors, allow_destroy: true
end
