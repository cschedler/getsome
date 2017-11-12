class Workout < ApplicationRecord
	belongs_to :user
	has_many :movements, dependent: :destroy
	accepts_nested_attributes_for :movements
end
