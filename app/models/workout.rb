class Workout < ApplicationRecord
	has_many :movements, dependent: :destroy
	belongs_to :users
end
