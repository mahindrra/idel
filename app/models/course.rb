class Course < ApplicationRecord
  belongs_to :user
  belongs_to :learner_style
  enum audiences:['First Year','Second Year(CSE)']
end
