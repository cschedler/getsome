class WorkoutsController < ApplicationController

	def show
		@workout = Workout.find(params[:id])
	end
	
	def index
		@workout = Workout.all
	end

	def new
	end

	def edit
		@workout = Workout.find(params[:id])
	end

	def create
		@workout = Workout.new(workout_params)

		@workout.save
		redirect_to @workout
	end

	def update
		@workout = Workout.find(params[:id])

		if @workout.update(workout_params)
			redirect_to @workout
		else
			render 'edit'
		end
	end

	private
	def workout_params
		params.require(:workout).permit(:wrkt_date, :title, :movement_number)
	end
end
