class WorkoutsController < ApplicationController

	def show
		@user = current_user
		@workout = @user.workout.find(params[:id])
	end
	
	def index
		@user = current_user
		@workout = @user.workout.all
	end

	def new
	end

	def edit
		@user = current_user
		@workout = @user.workout.find(params[:id])
	end

	def create
		@user = current_user
		@workout = @user.workout.new(workout_params)

		@workout.save
		redirect_to @user
	end

	def update
		@user = current_user
		@workout = @user.workout.find(params[:id])

		if @workout.update(workout_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = current_user
		@workout = Workout.find(params[:id])
		@workout.destroy

		redirect_to @user
	end

	private
	def workout_params
		params.require(:workout).permit(:wrkt_date, :title, :movement_number)
	end
end
