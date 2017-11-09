class MovementsController < ApplicationController
	def create
		@workout = Workout.find(params[:workout_id])
		@movement = @workout.movements.create(movement_params)

		@movement.save
		redirect_to workout_path(@workout)
	end

	def edit
		@movement = Movement.find(params[:id])
	end

	def update
		@movement = Movement.find(params[:id])
		@workout = @movement.workout

		if @movement.update_attributes(params[:movement])
			redirect_to edit_workouts_path
		else
			render 'edit'
		end
	end

	private
	def movement_params
		params.require(:movement).permit(:movement, :set, :rep, :weight, :duration)
	end
end
