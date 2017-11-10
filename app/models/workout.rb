class Workout < ApplicationRecord
	has_many :movements, dependent: :destroy
end
