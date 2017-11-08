class WorkoutsController < ApplicationController

	def show
		@workout = Workout.find(params[:id])
		@movement = Movement.find(params[:id])
	end
	
	def new
	end

	def create
		@workout = Workout.new(workout_params)
		@movement = Movement.new(movement_params)

		@workout.save
		@movement.save
		redirect_to @workout
	end

	private
	def workout_params
		params.require(:workout).permit(:wrkt_date, :title)
	end
	
	def movement_params
		params.require(:movement).permit(:movement, :set, :rep, :weight, :duration)
	end
end
