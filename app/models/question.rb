class Question < ApplicationRecord
	validates :name, presence: true
	validates :answer_a, presence: true
	validates :answer_b, presence: true
end
