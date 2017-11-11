class MovementsController < ApplicationController
	def create
		@workout = Workout.find(params[:workout_id])
		@movement = @workout.movements.create(movement_params)

		@movement.save
		redirect_to @workout
	end

	def edit
		@workout = Workout.find(params[:workout_id])
		@movement = @workout.movements.find(params[:id])
	end

	def update
		@workout = Workout.find(params[:workout_id])
		@movement = @workout.movements.find(params[:id])

		if @movement.update(movement_params)
			redirect_to @workout
		else
			render 'edit'
		end
	end

	def destroy
		@workout = Workout.find(params[:workout_id])
		@movement = @workout.movements.find(params[:id])
		@movement.destroy

		redirect_to @workout
	end

	private
	def movement_params
		params.require(:movement).permit(:movement, :set, :rep, :weight, :duration)
	end
end
