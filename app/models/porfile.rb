class Porfile < ApplicationRecord
  belongs_to :user
  belongs_to :learner_dimension_scale,optional: true
end
