class MovementsController < ApplicationController
	def create
		@workout = Workout.find(params[:workout_id])
		@movement = @workout.movements.create(movement_params)

		if @movement.save
			redirect_to [current_user, @workout]
		else
			redirect_to [current_user, @workout]
		end
	end


	def edit

		@workout = Workout.find(params[:workout_id])
		@user = @workout.user
		@movement = @workout.movements.find(params[:id])
	end

	def update
		@workout = Workout.find(params[:workout_id])
		@user = @workout.user
		@movement = @workout.movements.find(params[:id])

		if @movement.update(movement_params)
			redirect_to [@user, @workout]
		else
			render 'edit'
		end
	end

	def destroy
		@workout = Workout.find(params[:workout_id])
		@user = @workout.user
		@movement = @workout.movements.find(params[:id])
		@movement.destroy

		redirect_to [current_user, @workout]
	end

	private
	def movement_params
		params.require(:movement).permit(:movement, :set, :rep, :weight, :duration)
	end
end
