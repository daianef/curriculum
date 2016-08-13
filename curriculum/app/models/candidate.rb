class Candidate < ActiveRecord::Base
  has_one :address


  has_many :educations
  has_many :experiences
  has_many :extracurriculars
  has_many :languages
  has_many :phones
  has_many :positions
  has_many :skills
end
