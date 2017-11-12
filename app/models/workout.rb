class Workout < ApplicationRecord
	belongs_to :users
	has_many :movements, dependent: :destroy
	accepts_nested_attributes_for :movements
end
